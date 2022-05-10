module "iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 4"

  trusted_role_arns = [
    "arn:aws:iam::310486407552:root",
    "arn:aws:iam::310486407552:user/Harris",
  ]

  create_role = true

  role_name         = var.rolename
  role_requires_mfa = true

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchActionsEC2Access",
  ]
  number_of_custom_role_policy_arns = 4
}