angular.module('escomm')
.controller('MainCtrl', function ($scope, $http) {
  $scope.sendInvite = function() {
      console.log ("sending");
      $scope.formData.firstName = "";
      $scope.formData.lastName = "";
      $scope.formData.emailAddress = "";
      $scope.formData.emailLanguage = "";
      $scope.formData.customMessage = "";

      var data = $.param({
          json: JSON.stringify({
              first_name: $scope.formData.firstName,
              last_name: $scope.formData.lastName,
              email_address: $scope.formData.email_address,
              email_language: $scope.formData.email_language,
              custom_message: $scope.formData.customMessage
          })
      });
      $http.post("https://crucore.com/api.php?a=invite", data).success(function(data, status) {
          $scope.hello = data;
      })
  }
})