resource "aws_iam_user" "tom"{
    name = "tim"
    path = "/"
}
resource "aws_iam_group" "developers" { 

    name = "developers2" 

    path = "/" 

} 
resource "aws_iam_group_membership" "developers_team" { 

  name = "developers-group-membership" 

  users = [ 
      "${aws_iam_user.tom.name}"
] 

  group = "${aws_iam_group.developers.name}"
} 