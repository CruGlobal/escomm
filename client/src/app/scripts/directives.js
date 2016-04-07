angular.module('escomm')

.service('inviteSuccess', function inviteSuccess() {
  var inviteSuccess = this;

  inviteSuccess.message = false;
  inviteSuccess.successMessage = "";
  inviteSuccess.showError = false;
  inviteSuccess.failureMessage = "";
})

.controller('ContactsCtrl', function ($scope, $http, $location, inviteSuccess) {
  console.log("ContactsCtrl");
})

.controller('MainCtrl', function ($scope, $http, $location, inviteSuccess) {

  $scope.FormData = {};
  $scope.isDisabled = false;
  $scope.showSendingBtn = false;
  $scope.showSendBtn = true;
  $scope.showErrorMsg = false;
  var first = this;
  first.inviteSuccess = inviteSuccess;
  $scope.sendInviteSuccess = first.inviteSuccess.message;
  $scope.successMessage = first.inviteSuccess.successMessage;
  console.log(first.inviteSuccess.message);

  $scope.showError = first.inviteSuccess.showError;
  $scope.failureMessage = first.inviteSuccess.failureMessage;

  $scope.sendInvite = function() {
    //disable/show button
    $scope.isDisabled = true;
    $scope.showSendBtn = false;
    $scope.showSendingBtn = true;

    $scope.FormData.first_name = $scope.firstName;
    $scope.FormData.last_name = $scope.lastName;
    $scope.FormData.email_address = $scope.emailAddress;
    $scope.FormData.email_language = $scope.emailLanguage;
    $scope.FormData.custom_message = $scope.customMessage;

    //https://crucore.com/api.php?a=invite
    $http.post("https://crucore.com/api.php?a=invite", angular.toJson($scope.FormData)).success(function(data, status) {
      console.log("Success")
      if(data.success) {
        var msg = data.msg;
        console.log(msg);
        first.inviteSuccess.message = true;
        first.inviteSuccess.successMessage = msg;
      } else {
          var msg = data.msg;
          console.log(msg);
          first.inviteSuccess.showError = true;
          first.inviteSuccess.failureMessage = msg;
      }
      $location.path( '/contacts_activity' );
    });
  }
})