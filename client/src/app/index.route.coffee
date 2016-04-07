angular.module 'escomm'
  .config ($routeProvider) ->
    'ngInject'
    $routeProvider
      .when('/home', {templateUrl: 'app/main/main.html', controller: 'MainCtrl'})
      .when('/signed_in_home', {templateUrl: 'app/views/signed_in_home.html', controller: 'MainCtrl'})
      .when('/send_invite', {templateUrl: 'app/views/send_invite.html', controller: 'MainCtrl'})
      .when('/resources', {templateUrl: 'app/views/resources.html', controller: 'MainCtrl'})
      .when('/about', {templateUrl: 'app/views/about.html', controller: 'MainCtrl'})
      .when('/settings', {templateUrl: 'app/views/settings.html', controller: 'MainCtrl'})
      .when('/contact_us', {templateUrl: 'app/views/contact_us.html', controller: 'MainCtrl'})
      .when('/confirm_invite', {templateUrl: 'app/views/confirm_invite.html', controller: 'MainCtrl'})
      .when('/account_settings', {templateUrl: 'app/views/account_settings.html', controller: 'MainCtrl'})
      .when('/contacts_activity', {templateUrl: 'app/views/contacts_activity.html', controller: 'ContactsCtrl'})
      .when('/', {templateUrl: 'app/main/main.html', controller: 'MainCtrl'})
