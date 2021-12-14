# python-app
Python App - Containerized, K8s AWS deployment, K8s manifests

## Structure to the Mono Repo:

![image](https://user-images.githubusercontent.com/55613494/146029058-0069bd9a-e114-4a1a-869d-20fdc6b976ab.png)

1. All Github Actions pipelines are maintained in .github/workdflows
2. All Application Code and Dockerfile for containerizing the Python App are maintained in Application-Code 
3. All IaC Terraform Code to deploy the EKS cluster is maintained in K8s-Terraform-Code
4. All K8s manifest to deploy the Python App are maintained in K8s-Deployment-Manifests

Secrets used by CI/CD pipelines are kept in GitHub Secrets(not coded in Pipelines)

![image](https://user-images.githubusercontent.com/55613494/146029897-c926cd86-8649-48f3-9ffb-493fb6070514.png)


## Pipelines created (present in .github/workflows):

### 1. Package the Python App into a Docker container and push it to Docker Hub Registry (docker-image.yml)
 Steps:
 1. Login to Docker Hub Registry
  2. Build the Docker image from the Dockerfile and Source Code in Application-Code folder
  3. Push built image to Docker HUB Registry
  4. Delete the Local Image Built (House-keeping)
#### Screenshots for Point 1:
Image in Docker Hub:

![image](https://user-images.githubusercontent.com/55613494/146034148-8c1fb7d2-b483-45f3-9b0b-6f9c12d91c11.png)

Testing locally:

![image](https://user-images.githubusercontent.com/55613494/146034459-4634fff5-7825-41af-a4f0-bfca6832d999.png)
![image](https://user-images.githubusercontent.com/55613494/146034879-8ddcb763-f220-4da4-8d14-07e93c50fcd8.png)

### 2.  IaC TF code to deploy EKS cluster (k8s-terraform.yml)
   Steps:
   1. Checkout the Github Repo
   2. Configure AWS Credentials CLI for TF deploy to take place.
   3. Setup Terraform on build machine
   4. TF Init
   5. TF Plan
   6. TF Apply with auto-approve set to true

Note: I have stored the state file in a private S3 bucket that I hosted for testing purposes
 
![image](https://user-images.githubusercontent.com/55613494/146032835-58f4ebfa-693b-4757-9633-c1ec26c8758b.png)

#### Screenshots for Point 2:
Cluster deployed:

![image](https://user-images.githubusercontent.com/55613494/146033216-74da1154-2ab3-4793-934a-33829493c5ab.png)

Worker Nodes:

![image](https://user-images.githubusercontent.com/55613494/146033308-2aff0b91-294c-4535-a8b9-27640f76eee0.png)


### 3. Flow to destroy cluster for house-keeping (k8s-terraform-destroy.yml)
### 4. Flow to deploy K8s object into the EKS cluster(k8s-deployments.yml)

   Steps:
   1. Checkout the Github Repo
   2. Kubectl install on build machine
   3. Config AWS credentials
   4. Get Kube config from EKS using AWS CLI 
   5. Login to the Docker HUB Registry
   6. Kubectl commands to deploy the K8s objects Service and Deployment

#### Screenshots for Point 4:
Kubectl to get status if K8s objects:

![image](https://user-images.githubusercontent.com/55613494/146033726-7a20514a-4847-4074-81aa-52a1cca5d098.png)

Access the app from the browser using the EXTERNAL-IP stated above

![image](https://user-images.githubusercontent.com/55613494/146033947-7d4c2d13-8d85-407b-88dd-5b13a04a6fb6.png)

#### Screenshots for PIPELINES Working:
Docker Build pipeline:

![image](https://user-images.githubusercontent.com/55613494/146036717-7edc55ab-e62d-4886-a3e5-d15f92b9a379.png)
![image](https://user-images.githubusercontent.com/55613494/146036867-5fd68c62-2203-4489-bd7f-decf3652fb0b.png)

TF INIT PLAN APPLY pipeline:

![image](https://user-images.githubusercontent.com/55613494/146036937-51e723f0-4c5f-4610-8a1e-79765dc81bed.png)
![image](https://user-images.githubusercontent.com/55613494/146037013-fa94cb5f-b1f6-4c6e-9ca8-c1da1f81fb6b.png)

K8s objects deploy pipeline:

![image](https://user-images.githubusercontent.com/55613494/146037102-c45b8e3f-b4d5-4a52-b035-532e12d38d08.png)
![image](https://user-images.githubusercontent.com/55613494/146037148-3dffa5a9-c5a1-46f1-8c71-74359630e211.png)





