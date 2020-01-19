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
		
        stage('Publish') {
			nexusPublisher nexusInstanceId: 'http://34.65.22.209:8081/', nexusRepositoryId: 'devopsrepo', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: 'project/target/project-1.1.war']], mavenCoordinate: [artifactId: 'proj1', groupId: 'ci.jenkins.gcp', packaging: 'war', version: '1.2']]]
		}
		
        
        stage('Deploy') { 
            steps {
              echo  "Deploying..."
            }
        }
    }
}
