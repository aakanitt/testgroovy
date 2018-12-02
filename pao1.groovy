#!groovy
env.project_name = "testdocker1"
env.app_name = "test-nginx"
env.tag_version = env.app_name + "-" + env.BUILD_NUMBER
env.ecr_repo = "878147804699.dkr.ecr.ap-southeast-1.amazonaws.com/pao/nginx"

node {
   stage('Source') { // for display purposes
      git 'https://github.com/aakanitt/testgroovy.git'
   }
   stage('Build Docker Image'){
                    sh '''
                      ${WORKSPACE}/script/buildDockerImage.sh $app_name $tag_version ${WORKSPACE} $ecr_repo
                    '''
   }
}
