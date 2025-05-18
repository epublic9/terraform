pipeline {
  agent any

  environment {
    GOOGLE_APPLICATION_CREDENTIALS = "${WORKSPACE}/gcp-creds.json"
    TF_VAR_credentials_file = "${WORKSPACE}/gcp-creds.json"
  }

  parameters {
    string(name: 'BRANCH_NAME', defaultValue: 'main', description: 'Git branch to build from')
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: "${params.BRANCH_NAME}",
            url: 'https://github.com/epublic9/terraform.git'   // 🔁 Replace this with your repo URL
      }
    }

    stage('Setup GCP Credentials') {
      steps {
        withCredentials([file(credentialsId: 'tf-credentials', variable: 'GCP_CREDS')]) {
          sh 'cp "$GCP_CREDS" "$GOOGLE_APPLICATION_CREDENTIALS"'
        }
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

  stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var-file="terraform.tfvars" -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: "Approve apply?"
                sh 'terraform apply tfplan'
            }
        }
  }
}
