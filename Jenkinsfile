pipeline {
    agent any 	
	environment {
		
		PROJECT_ID = 'PROJECT-ID'
                CLUSTER_NAME = 'CLUSTER-NAME'
                LOCATION = 'CLUSTER-LOCATION'
                CREDENTIALS_ID = 'gke'		
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

