app.factory('jobSearch', ['$http', function($http){
  return $http.get('https://pipes.yahoo.com/pipes/pipe.run?_id=9cb44301dcece96db1d28de6959bd25c&_render=json&locationinput1=80202&textinput2=web+developer')
  .success(function(data){
    return data;
  })
  .error(function(err){
    return err;
  });
}]);