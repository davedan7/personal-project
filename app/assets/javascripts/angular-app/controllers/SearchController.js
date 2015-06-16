app.controller('SearchController', ['$scope', 'jobSearch', function($scope, jobSearch){
  $scope.zipcode = "";
  $scope.searchWords = "";
  $scope.searchDescription = "";

  $scope.submitSearch = function() {
    jobSearch.search($scope.zipcode, $scope.searchWords)
    .success(function(data){
      $scope.searchResults = phraseParse(data);
    });
  };

  var phraseParse = function(data) {   // Takes json data and converts to strings
    // var wordCount = [];
    var items = data.value.items;

    for (var i = items.length - 1; i >= 0; i--) {
      console.log(wordCount(items[i].description.toLowerCase()));
    }
  };

  var wordCount = function(input) {    // Counts words passed from wordParse
    var split = input.replace(/[^a-zA-Z]/, " ").split(/\s+/),
    datapoints = {javascript: 0, ruby: 0, rails: 0, node: 0, angular: 0, angularjs: 0};
    for (var x = 0; x < split.length; x++) {
        datapoints[split[x]]++;
    }
    // for (var x = 0; x < split.length; x++) {
    //   if (datapoints[split[x]] === undefined ) {
    //     datapoints[split[x]] = 1;
    //   } else {
    //     datapoints[split[x]]++;
    //   }
    // }
    // keysSorted = Object.keys(datapoints).sort(function(a,b){   // sort words by occurrance 
    //   return datapoints[datapoints[a]] - datapoints[datapoints[b]]; 

    // });

    return datapoints;
  };

}]);