pipeline {
    agent any 	
	environment {
     
	}
	
    stages {	
	   stage('Scm Checkout') {            
		steps {
                  checkout scm
		}	
           }
           
	   stage('Build') { 
                steps {
                  echo "Cleaning and packaging..."
                  sh 'mvn clean package'		
                }
           }
	   stage('Test') { 
		steps {
	          cho "Testing..."
		  sh 'mvn test'
		}
	   }     
           stage('Deploy') { 
                steps {
                   echo  "Deploying..."
               }
          }
    }
}

