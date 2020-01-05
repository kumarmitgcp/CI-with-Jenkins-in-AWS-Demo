pipeline {
    agent any 
    stages {
       stage('Build') {
            steps {
                echo "Building..."
                sh 'mvn compile'
            }
        } 
       stage('Clean and Package') { 
            steps {
                echo "Cleaning and packaging..."
                sh 'mvn clean package'		
            }
        }
        stage('Publish Build Artifacts') { 
            steps {
                echo "Publishing Artifacts..."
                archiveArtifacts 'project/target/*.war'
            }
        }
        stage('Test') { 
            steps {
                echo "Testing..."
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
