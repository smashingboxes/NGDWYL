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

  $scope.processForm = (config) ->
    $scope.inputClass = 'standard'

    if $scope.goal
      $scope.showUser = true

    if $scope.goal && config == 'next'
      $http.post('/entries', { "entry": { "goal": $scope.goal, "submitted_by": $scope.user } }).success (data) ->
        $location.path '/entries/' + data.id

]

@app.controller 'listCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $scope.bodyClass = "body-full"
  $scope.pageID = "page-list"

  getUrl = '/entries/' + $routeParams.id + '.json'

  $http.get(getUrl).success (entry) ->
    $scope.entry = entry
    len = entry.goal.length
    console.log len

    switch
      when len <= 5
        $scope.h1Class = 'standard'
      when len >= 5 and len <= 10
        $scope.h1Class = 'small'
      when len > 10 and len <= 20
        $scope.h1Class = 'xsmall'
      when len > 20
        $scope.h1Class = 'xxsmall'

  $http.get('/entries.json').success (entries) ->
    entries = entries.slice(0, entries.length - 1 )
    $scope.entries = entries

]
