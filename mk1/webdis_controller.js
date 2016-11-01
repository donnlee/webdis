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
    var redis_channel = 'platina';
    $scope.redisChannel = redis_channel;
  	Webdis.subscribe(redis_channel, function(data, channel) {
		console.log('Message received on channel ' + channel + ': ' + data);
		// Update the text {{message}} in the html view.
		$scope.message = data;
    }, $scope);

}]);

