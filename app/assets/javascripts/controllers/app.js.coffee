@app.controller 'homeCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.pageID = "page-home"
]

@app.controller 'formCtrl', ['$scope', '$http', '$location', '$timeout', ($scope, $http, $location, $timeout) ->
  $scope.pageID = "page-form"

  $scope.inputClass = 'standard'

  $scope.onKeyDown = (subject) ->
    $timeout (->
      if subject is "goal"
        len = $scope.goal?.length
      else len = $scope.user?.length if subject is "user"

      switch
        when len <= 5
          $scope.inputClass = 'standard'
        when len >= 5 and len <= 10
          $scope.inputClass = 'small'
        when len > 10 and len <= 20
          $scope.inputClass = 'xsmall'
        when len > 20
          $scope.inputClass = 'xxsmall'
    ), 10

  $scope.processForm = ->
    $scope.showUser = true
    $scope.inputClass = 'standard'

    if $scope.goal && $scope.user
      $http.post('/entries', { "entry": { "goal": $scope.goal, "submitted_by": $scope.user } }).success (data) ->
        $location.path '/entries/' + data.id

]

@app.controller 'listCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $scope.bodyClass = "body-full"
  $scope.pageID = "page-list"

  getUrl = '/entries/' + $routeParams.id + '.json'

  $http.get(getUrl).success (entry) ->
    console.log entry
    $scope.entry = entry

  $http.get('/entries.json').success (entries) ->
    entries = entries.slice(0, entries.length - 1 )
    $scope.entries = entries

]
