angular.module 'escomm'
  .factory 'myInterceptor', [ ->
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


angular.module 'escomm'
  .config [
    '$httpProvider'
    ($httpProvider) ->
      $httpProvider.interceptors.push 'myInterceptor'
      return
  ]

