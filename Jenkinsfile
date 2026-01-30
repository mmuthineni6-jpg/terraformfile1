pipeline {
    agent any
    parameters {
        booleanParam(name: 'TF_INIT', defaultValue: true, description: '')
        booleanParam(name: 'TF_VALIDATE', defaultValue: true, description: '')
        booleanParam(name: 'TF_PLAN', defaultValue: true, description: '')
        booleanParam(name: 'TF_APPLY', defaultValue: false, description: '')
        booleanParam(name: 'TF_ALL', defaultValue: false, description: '')
    }
    stages {
        stage('git clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/lab1-organization/terraformfile1.git',
                    credentialsId: 'github-https-creds'
            }
        }
        stage('Terraform Init') {
            when {
                expression { params.TF_INIT || params.TF_ALL }
            }
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Validate') {
            when {
                expression { params.TF_VALIDATE || params.TF_ALL }
            }
            steps {
                sh 'terraform validate'
            }
        }
        stage('Terraform Plan') {
            when {
                expression { params.TF_PLAN || params.TF_ALL }
            }
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            when {
                expression { params.TF_APPLY || params.TF_ALL }
            }
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}

