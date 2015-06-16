app.controller('SearchController', ['$scope', 'jobSearch', function($scope, jobSearch){
  $scope.zipcode = "";     // Define models for view to manipulate
  $scope.searchWords = ""; // zipcode model
  $scope.searchDescription = "";

  $scope.submitSearch = function() {
    jobSearch.search($scope.zipcode, $scope.searchWords)
    .success(function(data){
      $scope.searchResults = data;
    });
  };

  $scope.jsCounter = function(string) {
    $scope.jsCount = "testing";
  };

}]);