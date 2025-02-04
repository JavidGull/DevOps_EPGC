pipeline {
    agent none
    stages {
        stage( 'stage' ) {
          agent { label "prod"}
           steps {
             script {
                git branch: 'gh-pages', url: 'https://github.com/JavidGull/DevOps_EPGC.git' 
              }    
            }
        }
        stage( 'deploy_production' ) {
           agent {label "prod"}
            steps {
              sh '''  
                # Adding two lines below to stop and then remove the existing container 
                #sudo docker stop epgc_apache_ubuntu
                #sudo docker rm $(sudo docker ps -a --filter "name=^epgc_apache_ubuntu" --format "{{.ID}}")
                sudo docker build . -t epgc_image
                sudo docker run --name epgc_apache_ubuntu -p 99:80 -d epgc_image 
              '''
          }
        }
    }
}

