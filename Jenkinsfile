pipeline {
    agent any
    environment {
        // Setup Ruby to PATH
        RUBY_HOME = "/usr/local/opt/ruby"
        PATH = "$RUBY_HOME/bin:$PATH"
        LANG = "en_US.UTF-8"
    }
    parameters {
        string(name: 'APP_BUILD_FOLDER', defaultValue: './build', description: 'Application build output folder')
        string(name: 'APP_PACKAGES_FOLDER', defaultValue: './build/packages', description: 'Application packages output folder')
        string(name: 'APP_TEST_FOLDER', defaultValue: './build/test', description: 'Application test output folder')
    }
    options {
        // Stop the build early in case of compile or test failures
        skipStagesAfterUnstable()
    }
    stages {
        stage('Setup') {
            steps {
                script {
                    sh 'gem install bundler'
                    sh 'bundle install'
                    sh 'bundle exec pod install --repo-update'
                    // Copy node env file to export environment variables
                    withCredentials([
                        file(credentialsId: 'env-default', variable: 'env'), 
                        file(credentialsId: 'apple-authkey', variable: 'apple_authKey')
                        ]) {
                        sh 'rm -f .env.default'
                        sh 'cp $env .env.default'
                        sh 'rm -f Apple_AuthKey.p8'
                        sh 'cp $apple_authKey Apple_AuthKey.p8'
                    }
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
                            junit 'build/test/report.junit'
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
        stage('Build') {
            steps {
                script {
                    sh 'bundle exec fastlane build_dev'
                    sh 'bundle exec fastlane build_uat'
                }
            }
        }
        stage('Deploy') {
            when {
                branch 'main'
                expression {
                    currentBuild.result == null || currentBuild.result == 'SUCCESS'
                }
            }
            steps {
                script {
                    sh 'bundle exec fastlane build_staging'
                    sh 'bundle exec fastlane release_to_test_channel'
                }
            }
        }
        stage('Production') {
            when { branch pattern: "release(-v.+)?", comparator: "REGEXP"}
            steps {
                script {
                    sh 'bundle exec fastlane build_release'
                }
            }
        }
    }
    post {
        success {
            dir("${params.APP_PACKAGES_FOLDER}") {
                archiveArtifacts artifacts: "**/*.ipa"
                archiveArtifacts artifacts: "**/*.dSYM.zip", allowEmptyArchive: true
            }

            dir("${params.APP_TEST_FOLDER}") {                                                                            
                publishHTML target: [
                    allowMissing         : false,
                    alwaysLinkToLastBuild: false,
                    keepAll              : true,
                    reportDir            : './coverage',
                    reportFiles          : '**/*.html',
                    reportName           : 'Test Coverage'
                ]
            }
        }
        
        cleanup {
            sh "bundle exec fastlane delete_project_keychain"
            cleanWs()
        }
    }
}


