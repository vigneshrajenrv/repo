resource "aws_iam_user" "bus2" {
  name = "bus2"
  path = "/system/"
}
resource "aws_iam_access_key" "bus2" {
  user = aws_iam_user.bus2.name
}
resource "iam_user_login_profile_encrypted_password" "bus_login" {
  user = aws_iam_user.bus2.name
  password = "OCYyYUlvMzRPZjVVUktIdyZVI2U="
  password_reset_required = true
}
resource "aws_iam_user_policy" "operation_monitoring_management_policy" {
  name = "operation-monitoring-management-policy"
  user = aws_iam_user.bus2.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
                "iam:GenerateCredentialReport",
                "iam:GetPolicyVersion",
                "iam:GetAccountPasswordPolicy",
                "iam:GetServiceLastAccessedDetailsWithEntities",
                "iam:GenerateServiceLastAccessedDetails",
                "iam:GetServiceLastAccessedDetails",
                "iam:GetGroup",
                "iam:GetContextKeysForPrincipalPolicy",
                "iam:GetOrganizationsAccessReport",
                "iam:GetServiceLinkedRoleDeletionStatus",
                "iam:SimulateCustomPolicy",
                "iam:SimulatePrincipalPolicy",
                "iam:GenerateOrganizationsAccessReport",
                "iam:GetAccountAuthorizationDetails",
                "iam:GetCredentialReport",
                "iam:GetSAMLProvider",
                "iam:GetServerCertificate",
                "iam:GetRole",
                "iam:GetInstanceProfile",
                "iam:GetPolicy",
                "iam:GetAccessKeyLastUsed",
                "iam:GetSSHPublicKey",
                "iam:GetContextKeysForCustomPolicy",
                "iam:GetUserPolicy",
                "iam:GetGroupPolicy",
                "iam:GetUser",
                "iam:GetOpenIDConnectProvider",
                "iam:GetRolePolicy",
                "cloudwatch:DescribeInsightRules",
                "cloudwatch:DescribeAlarmHistory",
                "cloudwatch:GetDashboard",
                "cloudwatch:GetInsightRuleReport",
                "cloudwatch:GetMetricData",
                "cloudwatch:DescribeAlarmsForMetric",
                "cloudwatch:DescribeAlarms",
                "cloudwatch:GetMetricStream",
                "cloudwatch:GetMetricStatistics",
                "cloudwatch:GetMetricWidgetImage",
                "cloudwatch:ListManagedInsightRules",
                "cloudwatch:DescribeAnomalyDetectors",
                "ec2:*",
                "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}