pipeline {
  agent any

  parameters {
    string(name: 'BRANCH_NAME', defaultValue: 'main', description: 'Git branch to build from')
  }

  environment {
    GOOGLE_APPLICATION_CREDENTIALS = '/tmp/gcp-creds.json'
    TF_VAR_credentials_file        = '/tmp/gcp-creds.json'
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: "${params.BRANCH_NAME}",
            url: 'https://github.com/epublic9/terraform.git'
      }
    }

    stage('Setup GCP Credentials') {
      steps {
        withCredentials([file(credentialsId: 'tf-credentials', variable: 'GCP_CREDS')]) {
          sh '''
            echo "Copying GCP credentials..."
            cp "$GCP_CREDS" /tmp/gcp-creds.json
            chmod 600 /tmp/gcp-creds.json
          '''
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
        sh 'terraform plan -no-color -var-file="devterraform.tfvars" -out=tfplan'
      }
    }

    stage('Terraform Apply') {
      steps {
        script {
          timeout(time: 5, unit: 'MINUTES') {
            input message: "Approve apply?"
          }
          sh 'terraform apply -no-color tfplan'
        }
      }
    }
  }

  post {
    always {
      echo 'Cleaning up credentials...'
      sh 'rm -f /tmp/gcp-creds.json'
    }
  }
}
