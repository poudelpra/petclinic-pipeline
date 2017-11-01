
pipeline {
    agent any
        stages{
            stage('Build'){
                steps {
                    sh 'mvn clean package'
                }
                post {
                    success {
                            echo " Now Archieving"
                            archiveArtifacts artifacts: '**/target/*.war'
                    }
                }

            }
        }
}
