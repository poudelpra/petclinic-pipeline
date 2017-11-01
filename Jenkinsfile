
pipeline {
    agent any
        stages{
            stage('Build'){
                steps {
                    sh 'mvn clean package'
                }
                post {
                    success {
                            echo "Archieving Now"
                            archiveArtifacts artifacts: '**/target/*.war'
                    }
                }

            }
        
            stage('Deploy to stagning') {
                steps{
                    build job: 'Deploy-to-stagning'
                }
                
            }
        }
}



