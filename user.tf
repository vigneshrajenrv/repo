# create an iam user
resource "aws_iam_user" "dev-1" {
  name = dev-1
target_id = aws_organizations_account.dev1.id
}

# give the iam user programatic access
resource "aws_iam_access_key" "iam_access_key" {
  user = aws_iam_user.iam_user.name
}


# create an iam user
resource "aws_iam_user" "iam_user" {
  name = dev-1
}

# give the iam user programatic access
resource "aws_iam_access_key" "iam_access_key" {
  user = aws_iam_user.iam_user.name
}

# create the inline policy
data "aws_iam_policy_document" "code_commit_policy" {
  statement {
    actions = [
        "codecommit:*",
    ]

    resources = [
        "*"
    ]
  }
}

# attach the policy to the user
resource "aws_iam_user_policy" "code_commit_policy" {
  name    = "code_commit_policy"
  user    = aws_iam_user.iam_user.name
  policy  = data.aws_iam_policy_document.code_commit_policy.json
}


resource "aws_iam_access_key" "bus-1" {
  user = aws_iam_user.newuser1.name
}