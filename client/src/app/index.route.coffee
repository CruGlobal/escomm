angular.module 'escomm'
  .config ($routeProvider) ->
    'ngInject'
    $routeProvider
      .when('/home', {templateUrl: 'app/main/main.html', controller: 'MainCtrl'})
      .when('/signed_in_home', {templateUrl: 'views/signed_in_home.html', controller: 'MainCtrl'})
      .when('/send_invite', {templateUrl: 'views/send_invite.html', controller: 'MainCtrl'})
      .when('/resources', {templateUrl: 'views/resources.html', controller: 'MainCtrl'})
      .when('/about', {templateUrl: 'views/about.html', controller: 'MainCtrl'})
      .when('/settings', {templateUrl: 'views/settings.html', controller: 'MainCtrl'})
      .when('/contact_us', {templateUrl: 'views/contact_us.html', controller: 'MainCtrl'})
      .when('/', {templateUrl: 'app/main/main.html', controller: 'MainCtrl'})

