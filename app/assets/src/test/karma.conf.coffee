# Karma configuration
# http://karma-runner.github.io/0.10/config/configuration-file.html

module.exports = (config) ->
  config.set
    basePath: ''
    files: [
    ]
    exclude: []
    port: 8080
    logLevel: config.LOG_INFO
    autoWatch: false
    singleRun: false
  return
