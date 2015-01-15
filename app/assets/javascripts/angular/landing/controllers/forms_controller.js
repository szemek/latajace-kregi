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

  $scope.submit = function() {
    if ($scope.showName) {
      $scope.signup();
    } else if ($scope.showPassword) {
      $scope.signin();
    } else {
      $scope.check();
    }
  };

  $scope.check = function() {
    $scope.spinner = true;
    $.post('/api/users/check', $('form').serialize(), function(data) {
      $scope.go[data.action]();
      $scope.spinner = false;
      $scope.$apply();
    });
  };

  $scope.signin = function() {
    $scope.spinner = true;
    $.post('/api/users/sign_in', $('form').serialize(), function(data) {
      $scope.spinner = false;
      $scope.$apply();
      window.location.replace('/dashboard');
    }, 'json');
  }

  $scope.signup = function() {
    $scope.spinner = true;
    $.post('/api/users', $('form').serialize(), function(data) {
      $scope.spinner = false;
      $scope.$apply();
      window.location.replace('/dashboard');
    }, 'json');
  }

  $scope.closeModal = function() {
    $('.intro').show();

    $scope.modal = false;
  };
}]);
