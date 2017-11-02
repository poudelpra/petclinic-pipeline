

pipeline {
    agent any

    parameters {
         string(name: 'tomcat-dev', defaultValue: 'http://192.168.88.7:8081/', description: 'Staging Server')
         string(name: 'tomcat-prod', defaultValue: 'http://192.168.88.6:8080/', description: 'Production Server')
    }

    triggers {
         pollSCM('* * * * *')
     }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
                        sh " **/target/*.war root@${params.tomcat-dev}:/opt/tomcat-stag/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        sh " **/target/*.war root@${params.tomcat-prod}:/opt/tomcat-prod/webapps"
                    }
                }
            }
        }
    }
}


