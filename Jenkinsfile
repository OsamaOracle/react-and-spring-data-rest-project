pipeline {

    agent any
    stages {
       /* stage('DB Creation') {
			steps {
				sh "docker build -t osamazx/react-spring-rest-db -f resources/db/Dockerfile ."
                 withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_pass')]) {
                    sh "docker login -u osamazx/react-spring-rest-db -p ${docker_pass} "
                }
                sh "kubectl apply -f resources/k8s/spring/ns.yaml"
				sh "kubectl apply -f resources/k8s/db/deployment.yaml -n spring"
				sh "kubectl apply -f resources/k8s/db/svc.yaml -n spring"
                sh "kubectl apply -f resources/k8s/db/pv.yaml -n spring"
				}
			}*/
        stage('Build') {
            /*agent { 
				docker { image "maven:3-openjdk-8-slim" 
						args '-v spring_cache:/root/.m2'   
					}
				}*/
			steps {
                //if we have mvn on our Jenkins server we can run mvn command directly
                //if now we need to use an agent of maven docker container and so we need to install docker plugin on jenkins
				sh "mvn  clean verify"
			}
            post {
				success {
					archiveArtifacts 'target/react-and-spring-data-rest-*.jar'
				}
			}
        }    
        stage ('Docker Build'){
            steps {
                sh "docker build -t osamazx/react-spring-rest:${BUILD_ID} ."
            }
        }
        stage("Docker Push"){
            steps{
                withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_pass')]) {
                    sh "docker login -u osamazx -p ${docker_pass} "
                }
                sh "docker push osamazx/react-spring-rest:${BUILD_ID}"
            }
        }
        stage("Deploy to K8s"){
            steps{
                sh "kubectl apply -f resources/k8s/spring/ns.yaml"
                sh "kubectl apply -f resources/spring/svc.yaml -n spring"
                sh "kubectl apply -f resources/spring/deployment.yaml -n spring"
            }
        }    
    }
}
