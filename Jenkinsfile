

pipeline {
    agent any

    

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


