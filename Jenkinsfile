node {
    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', "dockerhub-credentials") {

        def customImage = docker.build("api-peliculas:lts")

        customImage.push()
    }    
}