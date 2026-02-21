pipeline {
    agent any
    parameters {
        booleanParam(name: 'TF_INIT', defaultValue: true, description: '')
        booleanParam(name: 'TF_VALIDATE', defaultValue: true, description: '')
        booleanParam(name: 'TF_PLAN', defaultValue: true, description: '')
        booleanParam(name: 'TF_APPLY', defaultValue: false, description: '')
        booleanParam(name: 'TF_DESTROY', defaultValue: false, description: '')
        booleanParam(name: 'TF_ALL', defaultValue: false, description: '')
    }
    stages {
        stage('Terraform Init') {
            when { expression { params.TF_INIT || params.TF_ALL || params.TF_DESTROY } }
            steps { 
                sh 'terraform init -upgrade' 
            }
        }
        stage('Terraform Validate') {
            when { expression { params.TF_VALIDATE || params.TF_ALL } }
            steps { 
                sh 'terraform validate' 
            }
        }
        stage('Terraform Plan') {
            when { expression { params.TF_PLAN || params.TF_ALL } }
            steps { 
                sh 'terraform plan -out=tfplan' 
            }
        }
        stage('Terraform Apply') {
            when { expression { params.TF_APPLY || params.TF_ALL } }
            steps {
                input message: 'Apply changes?'
                sh 'terraform apply tfplan'
            }
        }
        stage('Terraform Destroy') {
            when { expression { params.TF_DESTROY || params.TF_ALL } }
            steps {
                stage('Init for Destroy') {
                    steps { 
                        sh 'terraform init -upgrade' 
                    }
                }
                stage('Approval') {
                    steps {
                        input message: "Destroy all resources?"
                    }
                }
                stage('Destroy') {
                    steps {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
    post {
        always {
            sh 'rm -f tfplan || true'
            sh 'terraform state list || true'
        }
    }
}

