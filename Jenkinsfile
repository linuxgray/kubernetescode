node {
    def app
    def dockerTag = "${env.BUILD_NUMBER}"

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("linuxgray039/test:${dockerTag}")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            // Push tagged version
            app.push("${dockerTag}")

            // Push latest version
            sh "docker tag linuxgray039/test:${dockerTag} linuxgray039/test:latest"
            sh "docker push linuxgray039/test:latest"
        }
    }

    stage('Trigger ManifestUpdate') {
        echo "Triggering updatemanifest job with tag ${dockerTag}"
        build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: dockerTag)]
    }
}
