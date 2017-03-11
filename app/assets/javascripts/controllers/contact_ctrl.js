(function() {
  'use strict';

  angular.module("app").controller('contactCtrl',function($scope, $http) {
    function setup() {
      $http.get('/api/v1/contacts.json').then(function(response) {
        $scope.contacts = response.data;
      });
    }

    setup();

    $scope.propertyName = 'email_address';
    $scope.reverse = true;

    $scope.sortBy = function(propertyName){
      $scope.reverse = ($scope.propertyName === propertyName) ? !$scope.reverse : false;
      $scope.propertyName = propertyName;
    };

    $scope.deleteContact = function(contact) {
      var index = $scope.contacts.indexOf(contact);
      $http.delete('/api/v1/contacts/' + contact.id + '.json').then(function(response) {
        $scope.contacts.splice(index, 1);
      });
    };
  });
})();
