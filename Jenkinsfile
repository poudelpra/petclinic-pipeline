pipeline {
    agent any
        stages {
            stage('Build'){
                steps {
                    sh 'mvn clean package'
                }
                post{
                        success {
                            echo "Archiving Artifacts .. . . . . ..."
                            archiveArtifacts artifacts:'**/target/*.war'
                        }
                }
            }
            stage ('Deploy to stagning'){
                steps {
                    build job:'pipe-deploy-stag'
            }
                }
            stage ('Deploy to production'){
                steps {
                    timeout(time:5, unit: 'DAYS') {
                        input message: 'Approve PRODUCTION Deployment?'

                    }
                    build job:'pipe-deploy-prod'
                    }
                post {
                    success {
                        echo " Code Deployed to production"
                    
                    }
                    failure {
                        echo "Deployment Failed"
                    }
                }
                }
        }
}


