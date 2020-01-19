pipeline {
    agent any 
    stages {
	
	   stage('CodeQuality-SonarQube') {
            
			environment {
				scannerHome = tool 'sonarqube-scanner'
				sonar.projectKey = 'sandeep'
				sonar.user = 'admin'
				sonar.password = 'admin123'
			}
			
			steps {
				withSonarQubeEnv('sonarqube') {
					echo "SonarQube..."
					sh "${scannerHome}/bin/sonar-scanner"				
				}
				
				timeout(time: 5, unit: 'MINUTES') {
					waitForQualityGate abortPipeline: true
				}
            }
       }
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
		stage('Test') { 
			steps {
				echo "Testing..."
		sh 'mvn test'
			}
		}
		
        stage('Publish Build Artifacts') { 
            steps {
                echo "Publishing Artifacts..."
                archiveArtifacts 'project/target/*.war'
            }
        }
        
        stage('Deploy') { 
            steps {
              echo  "Deploying..."
            }
        }
    }
}
