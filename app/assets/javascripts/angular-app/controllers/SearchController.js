app.controller('MainController', ['$scope', 'jobSearch', function($scope, jobSearch){
  jobSearch.success(function(data){
    $scope.searchResults = data;
  });
}]);