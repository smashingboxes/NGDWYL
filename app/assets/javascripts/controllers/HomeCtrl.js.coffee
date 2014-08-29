@app.controller 'HomeCtrl', ['$scope', '$http', ($scope, $http) ->

  $scope.processForm = ->
    $scope.showUser = $scope.goal
    
    goal = $scope.goal
    user = $scope.user

    if goal && user 
      $http.post('/entries', { "entry": { "goal": goal, "submitted_by": user } })

]
