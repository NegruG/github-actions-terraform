resource "aws_db_subnet_group" "db" {
 name = "db"
 subnet_ids = data.terraform_remote_state.main.outputs.private_subnets
}

resource "aws_security_group" "db" {
 name = "db"
 vpc_id = data.terraform_remote_state.main.outputs.vpc_id
 description = "Allow Mysql traffic"
 ingress {
  description = "Allow mysql"
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 }
}


resource "aws_db_instance" "default" {
 identifier = "dbname"
 allocated_storage = 20
 storage_type = "gp2"
 engine = "mysql"
 engine_version = "5.7"
 instance_class = "db.t2.micro"
 name = "mydb"
 username = "foo"
 password = "foobarbaz"
 publicly_accessible = true
 db_subnet_group_name = aws_db_subnet_group.db.name
 skip_final_snapshot = true #used to delete the repo in the future without this you cant delete. There are bugs reported 
 vpc_security_group_ids = [aws_security_group.db.id]
}