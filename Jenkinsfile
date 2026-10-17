pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Salamat'
        STUDENT_SURNAME = 'Moldashev'
        STUDENT_GROUP   = 'IT2-2308'
        STUDENT_ID      = '37461'
        IMAGE_NAME      = 'moldashev-salamat-devops'
        CONTAINER_NAME  = 'moldashev-salamat-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'chmod +x scripts/Moldashev_Salamat_system.sh'
                sh './scripts/Moldashev_Salamat_system.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'bash -n scripts/Moldashev_Salamat_system.sh'
                sh 'test -f Moldashev_Salamat_info.txt'
                sh 'test -f app/app.py'
                sh 'test -f Dockerfile'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
                sh """docker run --name $CONTAINER_NAME \\
                      -e STUDENT_NAME=$STUDENT_NAME \\
                      -e STUDENT_SURNAME=$STUDENT_SURNAME \\
                      -e STUDENT_GROUP=$STUDENT_GROUP \\
                      -e STUDENT_ID=$STUDENT_ID \\
                      $IMAGE_NAME"""
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully' }
        failure { echo 'Pipeline failed' }
    }
}
