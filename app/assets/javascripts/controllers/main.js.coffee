@app = angular.module('HomeCtrl', ['ngRoute'])

@app.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/', {
      templateUrl: '../public/templates/home.html',
      controller: 'home'
    }).
    when('/doit', {
      templateUrl: '../public/templates/doit.html',
      controller: 'home'
    }).
    when('/done', {
      templateUrl: '../public/templates/done.html',
      controller: 'entries'
    }).
    otherwise({
      templateUrl: '../public/templates/home.html',
      controller: 'home'
    })
])
