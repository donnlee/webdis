// AngularJS + Webdis + Redis
// See https://github.com/adamgoose/angular-webdis

// Create app, include dependencies.
var app = angular.module("myApp", ['adamgoose.webdis']);

// Basic config (from angular-webdis readme on github).
app.config(['WebdisProvider', function(WebdisProvider) {
    // Your Webdis Host
    WebdisProvider.setHost('192.168.57.57');

    // Your Webdis Port (7379 by default)
    WebdisProvider.setPort(7379);
  }]);


app.controller('myController', ['$scope', 'Webdis', function($scope, Webdis) {
  	Webdis.subscribe('my-channel', function(data, channel) {
		console.log('Message received on channel ' + channel + ': ' + data);
		// Update the text {{message}} in the html view.
		$scope.message = data;
    }, $scope);

}]);
