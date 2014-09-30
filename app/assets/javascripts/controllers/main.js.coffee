@app = angular.module('ngdwyl', ['ngRoute', 'ngAnimate'])

@app.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->

  $routeProvider.
    when('/',
      templateUrl: '../public/templates/home.html',
      controller: 'homeCtrl'
    ).
    when('/doit',
      templateUrl: '../public/templates/doit.html',
      controller: 'formCtrl'
    ).
    when('/entries/:id',
      templateUrl: '../public/templates/show.html',
      controller: 'listCtrl'
    ).
    otherwise(
      templateUrl: '../public/templates/home.html',
      controller: 'homeCtrl'
    )

])
