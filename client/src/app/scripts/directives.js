angular.module('escomm')

.service('inviteSuccess', function inviteSuccess() {
  var inviteSuccess = this;

  inviteSuccess.message = false;
  inviteSuccess.fname = "";
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
  $scope.fname = first.inviteSuccess.fname;

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

    console.log(angular.toJson($scope.FormData));

    $http.post("https://crucore.com/api.php?a=invite", angular.toJson($scope.FormData)).success(function(data, status) {
      console.log("Success")
      if(data.success) {
        first.inviteSuccess.message = true;
        first.inviteSuccess.fname = $scope.firstName;
        var msg = data.msg;
        console.log(msg);
      } else {
          alert("Failure");
          console.log(data.msg);
      }

      $location.path( '/contacts_activity' );
    })
    .error(function(data, status){
      console.log("Error")
      console.log(data.error)
      $scope.showSendingBtn = false;
      $scope.showErrorMsg = true;
    });
  }
})