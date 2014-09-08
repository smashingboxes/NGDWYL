goal = undefined || localStorage.getItem('goal')
user = undefined || localStorage.getItem('user')

@app.controller 'home', ['$scope', '$http', ($scope, $http) ->

  $scope.processForm = ->
    $scope.showUser = $scope.goal
    
    goal = $scope.goal
    localStorage.setItem('goal', goal)

    user = $scope.user
    localStorage.setItem('user', user)

    if goal && user
      $http.post('/entries', { "entry": { "goal": goal, "submitted_by": user } })
      window.location = '/#/done'

]

@app.controller 'entries', ['$scope', '$http', ($scope, $http) ->
  $scope.goal = goal
  $scope.user = user


  $http.get('/entries.json').success (entries) ->
    $scope.entries = entries

]
