pipeline {
    agent any
    stages {
       stage('Branch gh-pages Git Checkout Code') {
          when { branch 'gh-pages'
          beforeAgent true}
          agent {label 'prod'}
          steps {
               git branch: 'gh-pages', url: 'https://github.com/JavidGull/DevOps_EPGC.git'  
             }
         }
      
       stage('Test gh-pages') {
          when { branch 'gh-pages' 
          beforeAgent true}
          agent {label 'prod'}
          steps {
                 sh "echo 'This test execution is for master branch'"   
             }
         }
        stage('deploy_production') {
           when {branch 'gh-pages' 
           beforeAgent true}
           agent {label "prod"}
            steps {
              sh '''  
                # Adding two lines below to stop and then remove the existing container 
                sudo docker stop epgc_apache_ubuntu 
                sudo docker rm $(sudo docker ps -a --filter "name=^epgc_apache_ubuntu" --format "{{.ID}}")
                sudo docker build . -t epgc_image
                sudo docker run --name epgc_apache_ubuntu -p 99:80 -d abode_image 
              '''
            }
        }
    }
}
