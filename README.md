# vpc-automation-with-terraform

This project automates the creation of a Virtual Private Cloud (VPC) in AWS using Terraform. It provides a modular approach to setting up AWS networking resources, such as subnets, NAT gateways, internet gateways, route tables, and more.

The project is divided into two main parts:
- **vpc-resource**: Defines the VPC and networking resources.
- **vpc-module**: Contains reusable Terraform modules for setting up VPC resources.

## Repository Structure
```plaintext
vpc-automation-with-terraform/
├── vpc-resource/              # Contains the AWS VPC resources
│   └── main.tf                # Main resource definition for creating the VPC
├── vpc-module/                # Contains reusable Terraform modules for VPC setup
│   ├── nat.tf                 # NAT Gateway configurations
│   ├── routes.tf              # Route Table definitions
│   ├── variables.tf           # Input variables for customization
│   ├── eip.tf                 # Elastic IP configurations
│   ├── providers.tf           # Provider settings (AWS)
│   ├── subnets.tf             # Subnet definitions
│   ├── vpc.tf                 # VPC resource creation
│   ├── igw.tf                 # Internet Gateway configurations
│   ├── route_association.tf   # Route table association
│   └── terraform.tfvars       # Variable values for Terraform
└── README.md                  # Main project documentation
```

## Project Overview
This project includes the following AWS resources:
- **VPC** with an IPv4 CIDR block.
- **Internet Gateways** attached to the VPC.
- **Public and Private Subnets** in multiple Availability Zones.
- **Elastic IPs** allocated for NAT Gateways.
- **NAT Gateways** created in the public subnets and associated with Elastic IPs.
- **Route Tables** for routing traffic within the VPC:
  - Public Route Tables for public subnets.
  - Private Route Tables for private subnets routing through NAT Gateways.
- **Route Table Associations** to bind subnets to their respective route tables.

## Requirements
- **Terraform** version 1.x or higher.
- **AWS account** with sufficient privileges to create VPC, subnets, gateways, and related resources.

## How to Use
### Step 1: Clone the Repository
Clone this repository to your local machine:
```bash
git clone https://github.com/clovisbernard/vpc-automation-with-terraform.git
cd vpc-automation-with-terraform
```

### Step 2: Set up AWS Credentials
```bash
aws configure
```
### Step 3: Initialize Terraform
```bash
cd vpc-module
terraform init
```
### Step 4: Plan the Terraform Execution
```bash
terraform plan
```
### Step 5: Apply the Terraform Configuration
```bash
terraform apply
```

### Step 6: Verify the Resources
Once the Terraform script completes, you should have:
- **A new VPC.**
- **Two Internet Gateways attached to the VPC.**
- **Two Public Subnets and Private Subnets in different availability zones.**
- **Two NAT Gateways with associated Elastic IPs.**
- **Properly configured Route Tables for public and private subnets.**

### Step 7: Destroy Resources (Optional)
```bash
terraform destroy
```

### How the Modules Work
- **vpc.tf: Defines the core VPC infrastructure.**
- **subnets.tf: Creates public and private subnets across multiple availability zones.**
- **eip.tf: Allocates Elastic IPs for the NAT Gateways.**
- **nat.tf: Configures the NAT Gateways within the public subnets.**
- **igw.tf: Configures the Internet Gateway for the VPC.**
- **routes.tf: Creates the Route Tables and routes for both public and private subnets.**
- **route_association.tf: Associates the Route Tables with the subnets.**
- **variables.tf: Defines the variables that can be customized for this setup.**
- **terraform.tfvars: Contains the variable values for Terraform execution.**

## Contributing
Feel free to fork the repository and submit pull requests for any improvements. If you encounter any issues, please open an issue on GitHub.

## License
This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.