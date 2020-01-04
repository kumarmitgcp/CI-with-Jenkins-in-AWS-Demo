pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                echo "Building..."
                bat label: 'Maven Build', script: 'mvn package'
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
