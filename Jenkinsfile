python {
    checkout scm

    docker.withRegistry('https://registry.example.com', "dockerhub-credentials") {

        def customImage = docker.build("api-peliculas:lts")

        customImage.push()
    }    
}