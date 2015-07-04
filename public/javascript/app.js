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

  dataFactory.postData = function(user) {

    var deferred = $q.defer();

    console.log(user)

    $http.post('post_user_info', user).
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

  $scope.user = {}
  $scope.user.age
  $scope.user.loc 
  $scope.user.gen = "Male"
  $scope.cool = 0
  $scope.showg = false
  $scope.gender = ["Male", "Female"]

  dataFactory.getData().then(function(data) {
    
    $scope.locs = data.locations
    $scope.age = data.age.sort()
  }, function(reason) {
    console.log('Failed: ' + reason);
  });

  $scope.Submit = function(){
      $scope.showg = false
      dataFactory.postData($scope.user).then(function(data) {
      $scope.showg = true
      $scope.crime = data;
    }, function(reason) {
      console.log('Failed: ' + reason);
    });
  }

}]);








