pipeline {
    agent any
    environment {
        REPO_URL = 'https://github.com/yonig15/elta-proj.git'
        KUBE_NAMESPACE = 'devops'
    }
    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: "${REPO_URL}"
            }
        }

        stage('Build and Publish Application') {
            steps {
                echo 'Building and Publishing .NET Core Application...'
                sh 'dotnet publish -c Release -o ./out'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image...'
                sh 'docker build -t elta-webapp:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker Image to DockerHub...'
                withDockerRegistry(credentialsId: 'dockerhub-credentials') {
                    sh 'docker push elta-webapp:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying Application to Kubernetes...'
                sh '''
                kubectl config set-context --current --namespace=${KUBE_NAMESPACE}
                kubectl apply -f K8s/deployments/app-deployment.yaml
                kubectl apply -f K8s/services/app-service.yaml
                '''
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
