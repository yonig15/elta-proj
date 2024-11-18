##Elta Kubernetes Project 🚀
This project demonstrates how to deploy Jenkins in a Kubernetes environment and automate the build and deployment of a .NET Core web application.


##📚 Table of Contents
Features
Technologies Used
Setup Instructions
Pipeline Workflow
Troubleshooting
Contributing
License
#<a name="features"></a>⚡ Features
Deployment of Jenkins in a Kubernetes namespace using Helm.
Persistent storage for Jenkins configuration and data.
Automated CI/CD pipeline to:
Build a .NET Core web application.
Deploy the application to a production namespace.
Port-forwarding for Jenkins access.
Configurable resource limits for Pods.
#<a name="technologies-used"></a>🛠️ Technologies Used
Orchestration: Kubernetes (Minikube).
CI/CD: Jenkins.
Infrastructure: Helm Charts.
Programming Language: .NET Core for the web application.
Containerization: Docker.
#<a name="setup-instructions"></a>🔧 Setup Instructions
Prerequisites
Ensure the following tools are installed:

Kubernetes cluster (e.g., Minikube).
kubectl CLI.
Helm CLI.
Docker (for building images).
Access to the GitHub repository: https://github.com/yonig15/elta-proj.git.
Steps
1. Create Namespaces
Run the following commands:
kubectl apply -f K8s/namespaces/devops-namespace.yaml
kubectl apply -f K8s/namespaces/prod-namespace.yaml

3. Configure Persistent Storage
Deploy the persistent volume and claim for Jenkins:
kubectl apply -f K8s/storage/pv.yaml
kubectl apply -f K8s/storage/pvc.yaml
Verify:
kubectl get pvc -n devops

3. Deploy Jenkins
Use Helm to install Jenkins:
helm install jenkins helm/ -n devops
Verify the Pod status:
kubectl get pods -n devops

5. Expose Jenkins via Service
Apply the NodePort service:
kubectl apply -f K8s/services/jenkins-service.yaml -n devops

5. Port-Forward Jenkins
Access Jenkins locally:
kubectl port-forward svc/jenkins-service 8080:8080 -n devops
Open http://localhost:8080 in your browser.

#<a name="pipeline-workflow"></a>📋 Pipeline Workflow
Pipeline Stages
Checkout: Clones the code from GitHub.
Build: Builds the .NET Core application.
Dockerize: Creates a Docker image of the application.
Deploy to DevOps: Deploys the application to the devops namespace.
Deploy to Production: Deploys the application to the prod namespace.
Testing the Pipeline
Save the pipeline in the Jenkinsfile located in the repository root. Open Jenkins, create a new pipeline project, and point it to the GitHub repository.

Run the pipeline and verify the logs for each stage.

#<a name="troubleshooting"></a>🛠️ Troubleshooting
Issue: Jenkins Pod stuck in ContainerCreating.
Solution: Verify Persistent Volume and Claim configurations:

kubectl describe pvc jenkins-pvc -n devops
Issue: Jenkins not accessible.
Solution: Ensure the NodePort service is configured correctly and use port-forwarding.
Issue: Pipeline fails at deployment stages.
Solution: Check the Kubernetes resource configurations in the deployments/ directory.
#<a name="contributing"></a>👥 Contributing
We welcome contributions! Please fork the repository, make your changes, and submit a pull request.

#<a name="license"></a>📄 License
It is an independent individual. No license
א
