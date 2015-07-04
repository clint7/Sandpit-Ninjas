var app = angular.module('ngApp', ['ui.bootstrap']);

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
    $scope.user = {}
    $scope.locs = data.locations
    $scope.age = data.age.sort()
  }, function(reason) {
    console.log('Failed: ' + reason);
  });

    $scope.gender = ["Male", "Female"]



}]);








