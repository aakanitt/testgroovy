#!groovy
node {
   stage('Source') { // for display purposes
      git 'https://github.com/aakanitt/testnginx.git'
   }
}
