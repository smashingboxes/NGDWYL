@app = angular.module('HomeCtrl', ['ngRoute'])

@app.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/', {
      templateUrl: '../public/templates/home.html',
      controller: 'HomeCtrl'
    }).
    when('/about', {
      templateUrl: '../public/templates/about.html',
      controller: 'HomeCtrl'
    }).
    otherwise({
      templateUrl: '../public/templates/home.html',
      controller: 'HomeCtrl'
    })
])
