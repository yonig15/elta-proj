
##command for apply namespace
kubectl apply -f devops-namespace.yaml

##command for apply jenkins with Helm
helm repo add jenkins https://charts.jenkins.io
helm repo update
helm install jenkins jenkins/jenkins --namespace devops -f helm/values.yaml


##password for jenkins
kubectl port-forward svc/jenkins-service 8080:8080 -n devops
kubectl exec -it <pod-name> -n devops -- cat /var/jenkins_home/secrets/initialAdminPassword 