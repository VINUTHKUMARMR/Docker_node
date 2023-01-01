pipeline{
    agent {label "slave3"}
    environment{
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-cred')
    }
    stages{
        stage('checkout scm'){
            steps{
               git changelog: false, poll: false, url: 'https://github.com/VINUTHKUMARMR/Docker_node.git'
            }
        }
        stage('build image'){
            steps{
                sh '''
                  
                  docker build -t daemon/nodeapp:$BUILD_NUMBER .
                  docker tag daemon/nodeapp:$BUILD_NUMBER vinuthkumarmr/mypractice:$BUILD_NUMBER
                  docker run -it -d --name newcon1 vinuthkumarmr/mypractice:$BUILD_NUMBER
                  
                  '''
            }
        }
        stage('loginto-hub'){
            steps{
                 sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image to hub'){
            steps{
                 sh 'docker push vinuthkumarmr/mypractice:$BUILD_NUMBER'
            }
        }
    }
    post {
        always{
            sh 'docker logout'
        }
    }
}
