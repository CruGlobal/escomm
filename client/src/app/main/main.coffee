'use strict'

class MainCtrl

  constructor: (@$scope, @webService) ->
    @setup()

  setup: ->
    @$scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    @$scope.formData =
      firstName: ''
      lastName: ''
      emailAddress: ''
      emailLanguage: ''
      customMessage: ''

  getData: ->
    promise = @webService.getGreeting()
    promise.then @success, @error
    
  success: (response) =>
    @$scope.fname = response.data.fname

  error: (response) =>
    @$scope.message = "Error!"
    
angular.module("escomm").controller "MainCtrl", MainCtrl
MainCtrl.$inject = ["$scope", "webService"]
