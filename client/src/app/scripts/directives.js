angular.module('escomm')
.controller('MainCtrl', function ($scope, $http, $location) {
  $scope.FormData = {};
  $scope.sendInvite = function() {
    $scope.FormData.first_name = $scope.firstName;
    $scope.FormData.last_name = $scope.lastName;
    $scope.FormData.email_address = $scope.emailAddress;
    $scope.FormData.email_language = $scope.emailLanguage;
    $scope.FormData.custom_message = $scope.customMessage;

    console.log(angular.toJson($scope.FormData));

    $http.post("https://crucore.com/api.php?a=invite", angular.toJson($scope.FormData)).success(function(data, status) {
      console.log("Success")
      $location.path( '/contacts_activity' );
    })
  }
})

