resource "aws_db_subnet_group" "postgres-subnet" {
  name        = "postgres-subnet"
  description = "RDS postgres subnet group"
  subnet_ids  = [aws_subnet.main-private-1.id]
}

resource "aws_db_parameter_group" "postgres" { 
   name   = "postgres"
  family = "postgres13"
  
  parameter {  
    name  = "log_connections"   
    value = "1"  
      }
}



resource "aws_db_instance" "postgres" { 
	identifier             = "postgres" 
	instance_class         = "db.m5.large"
	allocated_storage      = 20 
	storage_type            = "gp2"
	engine                 = "postgres" 
	engine_version         = "13.1" 
	username               = "jumia" 
	password               = var.RDS_PASSWORD 
	db_subnet_group_name   = aws_db_subnet_group.postgres-subnet.name
	vpc_security_group_ids = [aws_security_group.allow-postgres.id] 
	parameter_group_name   = aws_db_parameter_group.postgres.name
	publicly_accessible    = false 
  	skip_final_snapshot    = true
  tags = {
    Name = "postgres-instance"
  }

}





  #name                    = "jumia_phone_validator"
  #username                = "jumia"           # username
  #password                = var.RDS_PASSWORD # password
  #db_subnet_group_name    = aws_db_subnet_group.postgres-subnet.name
  #multi_az                = "false" # set to true to have high availability: 2 instances synchronized with each other
