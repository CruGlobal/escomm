'use strict'
personalized_ssk = angular.module('personalized_ssk', [
  'ngResource', 'ngSanitize',
  'ngAnimate', 'ngRoute',
  'personalized_ssk.WebService'
])

personalized_ssk.config(
  ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when('/home', {templateUrl: 'views/main.html', controller: 'MainCtrl'})
      .when('/signed_in_home', {templateUrl: 'views/signed_in_home.html', controller: 'MainCtrl'})
      .when('/send_invite', {templateUrl: 'views/send_invite.html', controller: 'MainCtrl'})
      .when('/resources', {templateUrl: 'views/resources.html', controller: 'MainCtrl'})
      .when('/about', {templateUrl: 'views/about.html', controller: 'MainCtrl'})
      .when('/settings', {templateUrl: 'views/settings.html', controller: 'MainCtrl'})
      .when('/contact_us', {templateUrl: 'views/contact_us.html', controller: 'MainCtrl'})
      .when('/', {templateUrl: 'views/main.html', controller: 'MainCtrl'})

  ]
)

personalized_ssk.factory 'myInterceptor', [ ->
  myInterceptor =
      'request': (config) ->
        config
      'requestError': (rejection) ->
        # do something on error
        if resp.status is 401
            d = $q.defer()
            storageService.logout()
            $location.url "/"
            $scope.$broadcast("notify", {message: "Sorry, an authentication error has occurred."})
            return d.promise
          $q.reject resp
        if canRecover(rejection)
          return responseOrNewPromise
        $q.reject rejection
      'response': (response) ->
        # do something on success
        response
      'responseError': (rejection) ->
        # do something on error
        if canRecover(rejection)
          return responseOrNewPromise
        $q.reject rejection

  myInterceptor
]

personalized_ssk.config [
  '$httpProvider'
  ($httpProvider) ->
    $httpProvider.interceptors.push 'myInterceptor'
    return
]
