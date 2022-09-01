pipeline {
agent {
docker {

image 'maven:3-alpine'
args '-v /root/.m2:/root/.m2'
}
}

stages {

stage('Build') {
steps {

sh 'mvn -B -DskipTests clean package'
}
}

stage('Test') {

steps {
sh 'mvn test'

}
post {

always {
  junit(
        allowEmptyResults: true,
        testResults: '*/test-reports/.xml'
      )
  archiveArtifacts artifacts: '**/*.jar', followSymlinks: false

}

}

}



}

}
