pipeline {
    agent any
    
    parameters {
        string(name: 'tomcat_prod', defaultValue: '192.168.88.9', description: 'Production Server')
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
                steps{
                    sh "scp -i **/target/*.war root@${params.tomcat_prod}:/app/tomcat1/webapps/"
                    sh "scp -i **/target/*.war root@${params.tomcat_prod}:/app/tomcat2/webapps/"
                    sh "scp -i **/target/*.war root@${params.tomcat_prod}:/app/tomcat3/webapps/"
		    sh "scp -i **/target/*.war root@${params.tomcat_prod}:/app/tomcat4/webapps/"
                    sh "scp -i **/target/*.war root@${params.tomcat_prod}:/app/tomcat5/webapps/"
                } 
           }
     }
}
