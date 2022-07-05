resource "aws_elastic_beanstalk_environment" "vprofile-bean-prod" {
  name = "vprofile-bean-prod"
  application = aws_elastic_beanstalk_application.vprofile-prod
  solution_stack_name = "64bit Amazon Linux 2 v4.1.1 running Tomcat 8.5 Corretto 11"
  cname_prefix = "vprofile-bean-prod-domain"
  setting {
    name = "VPCid"
    namespace = "aws:ec2:vpc"
    value = module.vpc.vpc_id
  }

  setting {
    namespace = "aws:autoscalling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws.ec2.vpc"
    name = "AssociatePublicIPAddress"
    value = "flase"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = join(",",[module.vpc.public_subnets[0],module.vpc.public_subnets[1],module.vpc.public_subnets[2]])
  }

setting {
  namespace = "aws:ec2:vpc"
  name = "ELBSubnets"
  value = join(",",[module.vpc.public_subnets[0],module.vpc.public_subnets[1],module.vpc.public_subnets[2]])
}
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "EC2KeyName"
    value = aws_key_pair.vprofilekey.key_name
  }
  setting {
    name = "Availability Zones"
    namespace = "aws:autoscaling:asg"
    value = "Any 3"
  }
  setting {
    name = "MinSize"
    namespace = "aws:autoscaling:asg"
    value = "1"
  }
  setting {
    name = "MaxSize"
    namespace = "aws:autoscaling:asg"
    value = "8"
  }

  setting {
    name = "environment"
    namespace = "aws:elasticbeanstalk:application:environment"
    value = "prod"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "LOGGING_APPENDER"
    value = "GRAYLOG"
  }

  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name = "SysteType"
    value = "basic"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "RollingUpdateEnabled"
    value = "true"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "RollingUpdateType"
    value = "Health"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "MaxbatchSize"
    value = "1"
  }

  setting {
    namespace = "aws:loadbalancer"
    name = "CrossZone"
    value = "true"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name = "StickinessEnabled"
    value = "true"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSizeType"
    value = "Fixed"
  }


  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSize"
    value = "1"
  }


  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "DeploymentPolicy"
    value = "Rolling"
  }



  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "SecurityGroups"
    value = aws_security_group.vprofile-prod-sg.id
  }

  setting {
    namespace = "aws:elbv2:loadbalancer"
    name = "SecurityGroups"
    value = aws_security_group.vprofile-bean-elb-sg.id
  }

depends_on = [aws_security_group.vprofile-bean-elb-sg,aws_security_group.vprofile-prod-sg]


}