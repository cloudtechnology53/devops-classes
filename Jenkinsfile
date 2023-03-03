pipeline {
  agent any
  parameters {
    string(name: 'REGION', defaultValue: 'ap-south-1', description: 'region')
    string(name: 'VPC_CIDR', defaultValue: '10.0.0.0/16', description: 'VPC CIDR range')
    string(name: 'PUBLIC_SUBNET_1_CIDR', defaultValue: '10.0.1.0/24', description: 'Public Subnet 1 CIDR range')
    string(name: 'PUBLIC_SUBNET_2_CIDR', defaultValue: '10.0.2.0/24', description: 'Public Subnet 2 CIDR range')
    choice(name: 'method', description: 'Select either apply or destroy',choices: ['apply', 'destroy'])
    
  }

  environment {
        TF_HOME = tool('terraform')
        TP_LOG = "WARN"
        PATH = "$TF_HOME:$PATH"
        ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID')
        SECRET_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

  stages {
    stage('Checkout Code') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/dev']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/cloudtechnology53/devops-classes.git']]])
      }
    }
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }
    
    stage('Terraform plan') {
      steps {
        sh "terraform plan -var 'access_key=$ACCESS_KEY' -var 'secret_key=$SECRET_KEY' -var 'vpc-cidr=${params.VPC_CIDR}' -var 'public-subnet-1-cidr=${params.PUBLIC_SUBNET_1_CIDR}' -var 'public-subnet-2-cidr=${params.PUBLIC_SUBNET_2_CIDR}'"
      }
    }

    stage('Terraform Apply') {
      steps {
        sh "terraform $method -auto-approve -var 'access_key=$ACCESS_KEY' -var 'secret_key=$SECRET_KEY' -var 'vpc-cidr=${params.VPC_CIDR}' -var 'public-subnet-1-cidr=${params.PUBLIC_SUBNET_1_CIDR}' -var 'public-subnet-2-cidr=${params.PUBLIC_SUBNET_2_CIDR}'"
      }
    }
  }
}