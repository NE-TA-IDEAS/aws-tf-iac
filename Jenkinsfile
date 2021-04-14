// Jenkinsfile
try {
  stage('checkout') {
    node {
      cleanWs()
      checkout scm
    }
  }

   // Run terraform init
  stage('init') {
    node {
          sh 'terraform init'
      }
  }

  // Run terraform plan
  stage('plan') {
    node {
          sh 'terraform plan'      
    }
  }

  if (env.BRANCH_NAME == 'terraform-iac') {

    // Run terraform apply
    stage('apply') {
      node {
            sh 'terraform destroy -auto-approve'
      }
    }

    // Run terraform show
    stage('show') {
      node {
            sh 'terraform show'
      }
    }
  }
  currentBuild.result = 'SUCCESS'
}
catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException flowError) {
  currentBuild.result = 'ABORTED'
}
catch (err) {
  currentBuild.result = 'FAILURE'
  throw err
}
finally {
  if (currentBuild.result == 'SUCCESS') {
    currentBuild.result = 'SUCCESS'
  }
}
