pipeline {
    agent any

    environment {
        GITHUB_REPO = 'https://github.com/yousefsalemW/EFE-EGY.git'
        GIT_BRANCH  = 'master'

        IMAGE_NAME  = 'alnaqib/efe-egy-web'
        IMAGE_TAG   = 'latest'

        CONTAINER_NAME = 'efe-egy-web'
        APP_PORT = '80'
    }

    stages {

        stage('Checkout Source Code') {
            steps {
                git branch: "${GIT_BRANCH}", url: "${GITHUB_REPO}"
            }
        }

        stage('Show Workspace') {
            steps {
                sh '''
                echo "===== Workspace ====="
                pwd
                ls -lah
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                '''
            }
        }

        stage('Show Docker Images') {
            steps {
                sh 'docker images'
            }
        }

        stage('Remove Old Container') {
            steps {
                sh '''
                docker rm -f ${CONTAINER_NAME} || true
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker run -d \
                    --name ${CONTAINER_NAME} \
                    -p 8080:${APP_PORT} \
                    ${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }

        stage('Verify Container') {
            steps {
                sh '''
                docker ps
                '''
            }
        }
    }

    post {

        success {
            echo '========================================='
            echo 'Build Completed Successfully'
            echo 'Project : EFE-EGY'
            echo 'GitHub  : https://github.com/yousefsalemW/EFE-EGY'
            echo 'Image   : alnaqib/efe-egy-web:latest'
            echo 'Author  : Yousef Salem Alnaqib'
            echo '========================================='
        }

        failure {
            echo 'Pipeline Failed.'
        }

        always {
            echo 'Pipeline Finished.'
        }
    }
}