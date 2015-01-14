app.controller('FormsController', ['$scope', function($scope) {
  $scope.showEmail = true;
  $scope.showNext = true;

  $scope.showModal = function() {
    $('.intro').hide();

    $scope.modal = true;
  };

  $scope.go = {
    signin: function() {
      $scope.showNext = false;
      $scope.showSignin = true;
      $scope.showPassword = true;
    },
    signup: function() {
      $scope.showNext = false;
      $scope.showSignup = true;
      $scope.showPassword = true;
      $scope.showName = true;
    }
  };

  $scope.check = function() {
    $.post('/api/users/check', $('form').serialize(), function(data) {
      $scope.go[data.action]();
      $scope.$apply();
    });
  };

  $scope.signin = function() {
    $.post('/api/users/sign_in', $('form').serialize(), function(data) {
      window.location.replace('/dashboard');
    }, 'json');
  }

  $scope.signup = function() {
    $.post('/api/users', $('form').serialize(), function(data) {
      window.location.replace('/dashboard');
    }, 'json');
  }

  $scope.closeModal = function() {
    $('.intro').show();

    $scope.modal = false;
  };
}]);
