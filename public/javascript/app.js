var app = angular.module('ngApp', []);

app.factory('dataFactory', ['$http', '$q', function($http, $q) {
  var dataFactory = {};

  dataFactory.getData = function() {

    var deferred = $q.defer();

    $http({ method: 'GET', url: 'get_locs'}).
    success(function(data, status, headers, config) {
      deferred.resolve(data)
    }).
    error(function(data, status, headers, config) {
      deferred.reject("FAIL")
    });

    return deferred.promise;
  }

  return dataFactory;

 }]);

app.controller('myCtrl', ['$scope', 'dataFactory', function($scope, dataFactory) {
  dataFactory.getData().then(function(data) {
    $scope.firstName = data.key1
    $scope.lastName = data.key2
  }, function(reason) {
    console.log('Failed: ' + reason);
  });

$scope.icons = ["something", "another", "again"];


}]);


app.controller('DropdownCtrl', function ($scope, $log) {
  $scope.items = [
    'The first choice!',
    'And another choice for you.',
    'but wait! A third!'
  ];

  $scope.status = {
    isopen: false
  };

  $scope.toggled = function(open) {
    $log.log('Dropdown is now: ', open);
  };

  $scope.toggleDropdown = function($event) {
    $event.preventDefault();
    $event.stopPropagation();
    $scope.status.isopen = !$scope.status.isopen;
  };
});






