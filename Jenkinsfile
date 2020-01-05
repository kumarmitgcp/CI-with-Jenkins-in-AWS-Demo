pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                echo "Building..."
                sh '''
		mvn clean
		mvn package
		'''
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
            }
        }
        stage('Deploy') { 
            steps {
              echo  "Deploying..."
            }
        }
    }
}
