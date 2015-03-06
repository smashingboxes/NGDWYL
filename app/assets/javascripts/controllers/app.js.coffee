@app.controller 'homeCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.pageID = "page-home"
]

@app.controller 'formCtrl', ['$scope', '$http', '$location', '$timeout', ($scope, $http, $location, $timeout) ->
  $scope.pageID = "page-form"

  $scope.onKeyDown = (subject) ->
    $timeout (->
      if subject is "goal"
        len = $scope.goal?.length
      else len = $scope.user?.length if subject is "user"

      if len >= 36
        $scope.readonly = true
        hide()
    ), 10

    hide = ->
      $timeout (->
        $('.error').removeClass('show').addClass('hidden');
      ), 5000

  $scope.processForm = (config) ->

    if $scope.goal
      $scope.showUser = true

    if $scope.goal && config == 'next'
      $http.post('/entries', { "entry": { "goal": $scope.goal, "submitted_by": $scope.user } }).success (data) ->
        $location.path '/entries/' + data.id

]

@app.controller 'listCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $scope.bodyClass = ""
  $scope.pageID = "page-list"

  getUrl = '/entries/' + $routeParams.id + '.json'

  $http.get(getUrl).success (entry) ->
    $scope.entry = entry

  $scope.reload = ->
    $http.get('/entries/random.json').success (entry) ->
      $scope.entry = entry

  $http.get('/entries.json').success (entries) ->
    entries = entries.slice(0, entries.length - 1 )
    $scope.entries = entries

]
