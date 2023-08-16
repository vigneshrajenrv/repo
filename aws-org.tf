resource "aws_organizations_account" "account" {
  name  = "my_new_account"
  email = "vigneshtn666@gmail.com"
}

# Provides a resource to create an AWS organization.
resource "aws_organizations_organization" "this" {

  # List of AWS service principal names for which 
  # you want to enable integration with your organization

  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "sso.amazonaws.com"
  ]

  feature_set = "ALL"
}

// Define new account
resource "aws_organizations_account" "my_new_account" {
  name  = "my_new_account"
  email = "john@doe.org"
}

provider "aws" {
  /* other provider config */
  assume_role {
    // Assume the organization access role
    role_arn = "arn:aws:iam::${aws_organizations_account.my_new_account.id}:role/OrganizationAccountAccessRole"
  }
  alias = "my_new_account"
}

# If you using Terraform only
terraform import aws_organizations_organization.my_org o-l2y9wtik0k

resource "aws_organizations_organizational_unit" "businessunit" {
    name      = "businessunit"
    parent_id = aws_organizations_organization.this.roots[0].id
  }
  
  
  resource "aws_organizations_organizational_unit" "dev" {
    name      = "dev"
    parent_id = aws_organizations_organizational_unit.businessunit.id
  
    depends_on = [
      aws_organizations_organizational_unit.businessunit
    ]
  }

  resource "aws_organizations_organizational_unit" "deployment" {
    name      = "deployment"
    parent_id = aws_organizations_organizational_unit.businessunit.id
  
    depends_on = [
      aws_organizations_organizational_unit.businessunit
    ]
  }