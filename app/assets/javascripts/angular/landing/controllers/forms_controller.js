app.controller('FormsController', ['$scope', '$translate', function($scope, $translate) {
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
      $scope.showPasswordConfirmation = true;
    }
  };

  $scope.submit = function() {
    if ($scope.showPasswordConfirmation) {
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
    }, 'json').fail(function(data) {
      var error = data.responseJSON.error;

      $scope.spinner = false;
      $scope.messages = [{description: error}];
      $scope.$apply();

      $('.notification').fadeIn(500).delay(2000).fadeOut(500);
    });
  }

  $scope.signup = function() {
    $scope.spinner = true;
    $.post('/api/users', $('form').serialize(), function(data) {
      $scope.spinner = false;
      $scope.$apply();
      window.location.replace('/dashboard');
    }, 'json').fail(function(data) {
      var errors = data.responseJSON.errors;
      var messages = _.map(errors, function(value, key) {
        return {field: key, description: value.join(', ')};
      });

      $scope.spinner = false;
      $scope.messages = messages;
      $scope.$apply();

      $('.notification').fadeIn(500).delay(2000).fadeOut(500);
    });
  }

  $scope.closeModal = function() {
    $('.intro').show();

    $scope.modal = false;
  };
}]);
