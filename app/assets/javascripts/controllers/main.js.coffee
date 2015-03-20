@app = angular.module('ngdwyl', ['ngRoute', 'ngAnimate', 'truncate', 'angulartics', 'angulartics.google.analytics'])

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
    otherwise( {redirectTo: '/'} )
])
