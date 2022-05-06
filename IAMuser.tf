#Creating users
resource "aws_iam_user" "newusers" {
  count = length(var.username)
  name  = element(var.username, count.index)
}

resource "aws_iam_user_policy_attachment" "ec2-user-full" {
  count      = length(var.username)
  user       = element(aws_iam_user.newusers.*.name, count.index)
  #policy_arn = "${aws_iam_policy.ec2_readonly.arn}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_login_profile" "newusers" {

  count                   = length(var.username)
  user                    = aws_iam_user.newusers[count.index].name
  pgp_key                 = "keybase:SiddharthReddy"
  password_reset_required = true
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length           = 8
  require_lowercase_characters      = true
  require_numbers                   = true
  require_uppercase_characters      = true
  require_symbols                   = true
  allow_users_to_change_password    = true

}
