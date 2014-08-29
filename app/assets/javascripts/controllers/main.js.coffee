@app = angular.module('HomeCtrl', ['ngRoute'])

@app.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/', {
      templateUrl: '../public/templates/home.html',
      controller: 'HomeCtrl'
    }).
    when('/doit', {
      templateUrl: '../public/templates/doit.html',
      controller: 'HomeCtrl'
    }).
    otherwise({
      templateUrl: '../public/templates/home.html',
      controller: 'HomeCtrl'
    })
])
