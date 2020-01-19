pipeline {
    agent any 
    stages {
	
	   stage('CodeQuality-SonarQube') {
            
			steps {
				withSonarQubeEnv('sonarqube') {
					echo "SonarQube..."							
					sh 'mvn sonar:sonar'
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
				nexusArtifactUploader {
					nexusVersion('nexus3')
					protocol('http')
					nexusUrl('http://34.65.22.209:8081/')
					groupId('ci.jenkins.gcp')
					version('1.2')
					repository('devopsrepo')					
					credentialsId('nexusadmin')
					artifact {
						artifactId('ci.jenkins.gcp')
						type('war')						
						file('proj112.war')						
					}					
				}
		    }
        }
		
		
        
        stage('Deploy') { 
            steps {
              echo  "Deploying..."
            }
        }
    }
}
