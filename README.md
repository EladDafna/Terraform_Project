# Terraform Project

## Overview

This project demonstrates the use of Terraform to automate the creation and configuration of a basic AWS infrastructure. The setup includes the creation of a Virtual Private Cloud (VPC), multiple subnets, security groups, web instances, and an S3 bucket to store the Terraform state files. The project is designed to be modular, with different components and resources organized into separate directories, reflecting how different employees might work on their machines in a collaborative environment.

## Project Structure

The project is divided into two main directories:
- **Directory "1":** This directory reflects the setup performed by the first employee on their machine, including the creation of the VPC, subnets, security groups, and web instances.
- **Directory "2":** This directory reflects the setup performed by the second employee, focusing on using the outputs from the first directory, such as the S3 bucket for storing the Terraform state.

## Steps and Solutions

### 1. Create VPC

- The project starts by defining a new VPC in AWS using Terraform. The VPC serves as a virtual network that houses all other resources, providing a secure and isolated environment.

### 2. Create 2 or 3 Subnets

- Inside the VPC, two or three subnets are created. These subnets allow for organizing and segmenting the network, with different subnets potentially being used for different purposes (e.g., public-facing services, internal applications).

### 3. Create an S3 Bucket

- An S3 bucket is created to store the Terraform state files remotely. This setup allows for collaboration between multiple users, as the state file is centrally stored and accessible. In the project, the second employee uses the outputs from the first directory to reference the S3 bucket.

### 4. Create Security Groups

- Security groups are created to control inbound and outbound traffic to the resources within the VPC. These groups are configured to allow only the necessary traffic, enhancing the security of the environment.

### 5. Create 2 Web Instances

- Two web instances are created and configured using `user_data` to automatically install and configure software (e.g., a web server) upon launch. The instances are placed within the subnets created earlier and are secured using the security groups.

### 6. Collaboration Using Outputs

- The project demonstrates collaboration by using Terraform outputs to share information between the two directories. For example, the S3 bucket created in Directory "1" is referenced and utilized by Directory "2", simulating how different team members might work together in a real-world scenario.

## How I Solved the Exercise

To solve this exercise, I organized the Terraform code into two main directories, each reflecting the work done by different employees on their machines:

- **Directory "1":** Contains the Terraform configurations for creating the VPC, subnets, security groups, web instances, and the S3 bucket. This directory serves as the primary setup, defining all necessary resources.

- **Directory "2":** Contains Terraform configurations that rely on the outputs from Directory "1". This setup demonstrates how different team members can collaborate by using shared resources, such as the S3 bucket, for storing the Terraform state.

### Repository Structure

- **Directory "1":** Contains the primary Terraform files for creating the VPC, subnets, security groups, and web instances.
- **Directory "2":** Contains Terraform files that reference the outputs from Directory "1" and configure additional resources as needed.

### Usage Instructions

To use this project, follow these steps:
1. Clone the repository from GitHub.
2. Navigate to Directory "1" and run `terraform init`, `terraform plan`, and `terraform apply` to create the initial resources.
3. Navigate to Directory "2" and run `terraform init`, `terraform plan`, and `terraform apply` to use the outputs from Directory "1" and configure additional resources.

## Conclusion

This project demonstrates a practical approach to using Terraform for infrastructure as code (IaC) in a collaborative environment. By organizing resources into separate directories and using outputs to share information between them, the project showcases how different team members can work together efficiently on a shared AWS environment.
