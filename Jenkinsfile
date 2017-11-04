pipeline {
    agent any
    
    parameters {
        string(name: 'tomcat_dev', defaultValue: '192.168.88.6', description: 'Stagning Server')
        string(name: 'tomcat_prod', defaultValue: '192.168.88.3', description: 'Production Server')
    }

    triggers {
        pollSCM('* * * * *')
    }
stages{  
    stage ('Build') {
        steps {
            sh 'mvn clean package'
        }
        post {
            success {
                echo "Now Archeving . . . . . . . . "
                archiveArtifacts artifacts: '**/target/*.war'
            }
        }
    }  
    stage('Deployments'){
        parallel{
            stage ('Deploy to Stagning'){
                steps{
                    sh "scp -i **/target/*.war root@192.168.88.3:/opt/tomcat/webapps"
                }
            }   
            stage ('Deploy to Production') {
                steps{
                    sh "scp -i **/target/*.war root@192.168.88.3:/opt/tomcat/webapps"
                }
            }
            }
        }

    }
}
