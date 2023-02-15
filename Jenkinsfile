pipeline {
  agent any
  parameters {
    string(name: 'VPC_CIDR', defaultValue: '10.0.0.0/16', description: 'VPC CIDR range')
    string(name: 'PUBLIC_SUBNET_1_CIDR', defaultValue: '10.0.1.0/24', description: 'Public Subnet 1 CIDR range')
    string(name: 'PUBLIC_SUBNET_2_CIDR', defaultValue: '10.0.2.0/24', description: 'Public Subnet 2 CIDR range')
    
  }
  stages {
    stage('Checkout Code') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/cloudtechnology53/devops-classes.git']]])
      }
    }
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Terraform Apply') {
      steps {
        sh "terraform apply -var 'vpc-cidr=${params.VPC_CIDR}' -var 'public-subnet-1-cidr=${params.PUBLIC_SUBNET_1_CIDR}' -var 'public-subnet-2-cidr=${params.PUBLIC_SUBNET_2_CIDR}'"
      }
    }
  }
}
