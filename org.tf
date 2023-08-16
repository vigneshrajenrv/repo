
resource "aws_organizations_organizational_unit" "business_unit" {
  name      = "business_unit3"
  parent_id = "r-628u"
  #Parent id is Root id

}

  resource "aws_organizations_policy_attachment" "business_policy" {
  policy_id = "p-rd0z4daa"   #replace policy id which you want to attach For Business unit
  target_id = aws_organizations_organizational_unit.business_unit.id
  
 }

#creating first acc under Business unit
  resource "aws_organizations_account" "dev1" {
    # A friendly name for the member account
    name  = "example-dev1"
    email = "robgos@getmail.tech"
  
    # Enables IAM users to access account billing information 
    # if they have the required permissions
    iam_user_access_to_billing = "ALLOW"
  
    tags = {
      Name  = "engineer-dev1"
      Owner = "user1"
      Role  = "development"
    }
  
    parent_id = aws_organizations_organizational_unit.business_unit.id
    
  }

  resource "aws_organizations_policy_attachment" "account1" {
  policy_id = "p-f41v57l7"  #replace policy id which you want to attach
  target_id = aws_organizations_account.dev1.id
  
 }

 
 #creating second acc under Business unit
  resource "aws_organizations_account" "dev2" {
    # A friendly name for the member account
    name  = "example-dev2"
    email = "deojep@toldme.info"
  
    # Enables IAM users to access account billing information 
    # if they have the required permissions
    iam_user_access_to_billing = "ALLOW"
  
    tags = {
      Name  = "engineer-dev2"
      Owner = "user2"
      Role  = "deployment"
    }
  
    parent_id = aws_organizations_organizational_unit.business_unit.id
   
  }

  resource "aws_organizations_policy_attachment" "account2" {
  policy_id = "p-zjtje2pu"   #replace policy id which you want to attach
  target_id = aws_organizations_account.dev2.id
  
}

#creating sandbox acc under Business unit
  resource "aws_organizations_account" "developer1" {
    # A friendly name for the member account
    name  = "example-developer"
    email = "basohofa@cyclelove.cc"
  
    # Enables IAM users to access account billing information 
    # if they have the required permissions
    iam_user_access_to_billing = "ALLOW"
  
    tags = {
      Name  = "engineer-developer"
      Owner = "user3"
      Role  = "developer"
    }
  
    parent_id = aws_organizations_organizational_unit.business_unit.id
   
  }

  resource "aws_organizations_policy_attachment" "account3" {
  policy_id = "p-48zd379v"   #replace policy id which you want to attach
  target_id = aws_organizations_account.developer1.id
  
}
