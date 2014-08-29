@app.controller 'HomeCtrl', ['$scope', '$http', ($scope, $http) ->

  $scope.processForm = ->
    $http.post('/entries', { "entry": { "goal": $scope.goal, "submitted_by": $scope.user } })

]
