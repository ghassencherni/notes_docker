node {

    stage('Clone repository') {
    /* Let's make sure we have the repository cloned to our workspace */
    git 'https://github.com/ghassencherni/notes_docker.git'
    
    }
    
    stage('Build and Push New ghassen-devopstt image') {
        withCredentials([usernamePassword(credentialsId: 'gitlab_registry', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
        sh """
        docker login -u="$USERNAME" -p="$PASSWORD" registry.gitlab.com
        echo "Building version v1.0.${env.BUILD_NUMBER}"
        docker build -t registry.gitlab.com/myartifakt/mynotes:latest .
        docker build -t registry.gitlab.com/myartifakt/mynotes:v1.0.${env.BUILD_NUMBER} .
        docker push registry.gitlab.com/myartifakt/mynotes:v1.0.${env.BUILD_NUMBER}
        docker push registry.gitlab.com/myartifakt/mynotes:latest
        """
        }
        stage ('Trigger wordpress_k8s')

       /* Once the new image is pulled on the Gitlab registry, we will trigger the wordpress_k8s job to deploy the cluster*/
     /* build job: 'wordpress_k8s', parameters: [string(name: 'Action', value: 'Deploy Wordpress'), , text(name: 'wordpress_image_version', value: 'v1.0.${env.BUILD_NUMBER}')], quietPeriod:5 */
    /*  build job: 'wordpress_k8s', parameters: [string(name: 'Action', value: 'Deploy Wordpress'), , text(name: 'wordpress_image_version', value: 'v1.0.' + String.valueOf(BUILD_NUMBER))], quietPeriod:5 */
    }
}
