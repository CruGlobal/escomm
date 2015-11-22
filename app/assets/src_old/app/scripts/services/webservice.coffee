'use strict'

class WebService

  constructor: (@$http) ->
    @baseUrl = "/api/v1/"

  getGreeting: () ->
    @$http.get(@baseUrl + "greet")

angular.module "personalized_ssk.WebService", [], ($provide) ->
  $provide.factory "webService", ["$http", ($http) -> new WebService($http)]
