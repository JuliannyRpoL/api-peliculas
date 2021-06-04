node {
    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', "dockerhub-credentials") {

        def customImage = docker.build("julirpo/api-peliculas")

        customImage.push()
    }    
}