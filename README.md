# CI-with-Jenkins-in-GCP-Demo
The repo does following tasks:

1. Build a war file from project.
2. Build a tomcat image with above war file deployed.
3. Push the image to docker hub.
4. deploy the image using deployment.yaml file to kubernetes cluster.
5. expose the kubernetes service using deployment.yaml.
