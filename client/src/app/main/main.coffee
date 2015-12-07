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
    @getData()

  getData: ->
    promise = @webService.getGreeting()
    promise.then @success, @error
    
  success: (response) =>
    @$scope.fname = response.data.fname

  error: (response) =>
    @$scope.message = "Error!"


MainCtrl.$inject = ["$scope", "webService"]
angular.module("escomm").controller "MainCtrl", MainCtrl
