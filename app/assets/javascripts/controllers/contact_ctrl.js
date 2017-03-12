(function() {
  'use strict';

  angular.module("app").controller('contactCtrl',function($scope, $http) {
    function setup() {
      $http.get('/api/v1/contacts.json').then(function(response) {
        $scope.contacts = response.data;
      });
    }

    setup();

    $scope.filter0ptions = {
      stores: [
          {id : 2, name : 'Display All', email_address: ''},
          {id : 3, name : '.com', email_address: '.com'},
          {id : 4, name : '.co.uk', email_address: '.co.uk'},
          {id : 5, name : '.info', email_address: '.info'},
          {id : 6, name : '.ca', email_address: '.ca'},
          {id : 7, name : '.biz', email_address: '.biz'},
          {id : 8, name : '.us', email_address: '.us'},
          {id : 9, name : '.edu', email_address: '.edu'},
          {id : 10, name : '.net', email_address: '.net'},
          {id : 11, name : '.org', email_address: '.org'},
          {id : 12, name : '.de', email_address: '.de'}
        ]
      };

    $scope.sortOptions = {
      stores: [
        {id : 1, name : 'A-Z' },
        {id : 2, name : 'Z-A' },
      ]
    };

    $scope.filterEmail = {
      store: $scope.filter0ptions.stores[0]
    };

    $scope.sortEmail = {
      store: $scope.sortOptions.stores[0]
    };

    $scope.$watch('sortEmail', function() {
      console.log($scope.sortEmail);
      if ($scope.sortEmail.store.id === 2) {
        $scope.reverse = true;
      } else {
        $scope.reverse = false;
      }
    }, true);

    $scope.customFilter = function(contact) {
      if (contact.email_address === $scope.filterEmail.store.email_address) {
        return true;
      } else if ($scope.filterEmail.store.email_address === '') {
        return true;
      } else {
        return false;
      }
    };

    $scope.deleteContact = function(contact) {
      var index = $scope.contacts.indexOf(contact);
      $http.delete('/api/v1/contacts/' + contact.id + '.json').then(function(response) {
        $scope.contacts.splice(index, 1);
      });
    };
  });
})();
