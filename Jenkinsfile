pipeline {
    agent any
    environment {
        // Setup Ruby to PATH
        RUBY_HOME = "/usr/local/opt/ruby"
        PATH = "$RUBY_HOME/bin:$PATH"
    }
    options {
        // Stop the build early in case of compile or test failures
        skipStagesAfterUnstable()
    }
    stages{
        stage('Setup') {
            steps {
                script {
                    sh 'gem install bundler'
                    sh 'bundle install'
                    // Copy node env file to export environment variables
                    withCredentials([
                        file(credentialsId: 'env-default', variable: 'env'), 
                        file(credentialsId: 'apple-authkey', variable: 'apple_authKey')
                        ]) {
                        sh 'rm -f .env.default'
                        sh 'cp $env .env.default'
                        sh 'cp $apple_authKey Apple_AuthKey.p8'
                    }
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'bundle exec fastlane build_dev'
                }
            }
        }
        stage('Parallel Stage') {
            failFast true
            parallel {
                stage('Test') {
                    steps {
                        script {
                            sh 'bundle exec fastlane unit_tests'
                        }
                    }
                }
                stage('Check') {
                    steps {
                        script {
                            sh 'bundle exec fastlane check'
                        }
                    }
                }
            }
        }
        stage('Deploy') {
            when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS' 
              }
            }
            steps {
                script {
                    sh 'echo deploy'
                }
            }
        }
    }
    post {
        success {
            echo 'TODO: Archiving ...'
        }
    }
}


