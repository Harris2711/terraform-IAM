output "user_arn" {
  value = aws_iam_user.newusers.*.arn
}

output "password" {
  value = aws_iam_user_login_profile.newusers.*.encrypted_password
}

