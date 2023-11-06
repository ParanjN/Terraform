data "aws_vpc" "vpc" {
    filter {
        name = "tag:Name"
        values = ["*ue1-vpc"]
    }
}

data "aws_subnets" "private"{
    filter{
        name="vpc-id"
        values = [data.aws_vpc.vpc.id]
    }
    filter {
      name = "tag:Name"
      values = [ "*sub-prv-0", "*sub-prv-1" ]
    }
}


data "aws_security_groups" "default" {
    filter {
      name = "vpc-id"
      values = [ data.data.aws_vpc.vpc.id ]
    }

    filter {
      name = "group-name"
      values = [ "default", "*peering*" ]
    }
  
}

data "aws_iam_role" "lambda_role"{
    name = var.iam_role_lambda
}

data "aws_iam_role" "stepfn_role" {
  name = var.iam_role_step_fn
}