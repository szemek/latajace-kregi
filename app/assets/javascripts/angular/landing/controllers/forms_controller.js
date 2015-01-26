app.controller('FormsController', ['$scope', '$translate', function($scope, $translate) {
  $scope.showEmail = true;
  $scope.showNext = true;
  $scope.hiddenPassword = true;
  $scope.step = 'check';

  $scope.showModal = function() {
    $('.intro').hide();

    $scope.modal = true;
  };

  $scope.showPasswordText = function() {
    $('#user_password').attr('type', 'text');
    $scope.hiddenPassword = false;
  };

  $scope.hidePasswordText = function() {
    $('#user_password').attr('type', 'password');
    $scope.hiddenPassword = true;
  };

  $scope.go = {
    signin: function() {
      $scope.showNext = false;
      $scope.showSignin = true;
      $scope.showPassword = true;
      $scope.showBack = true;
    },
    signup: function() {
      $scope.showNext = false;
      $scope.showSignup = true;
      $scope.showPassword = true;
      $scope.showBack = true;
    },
    back: function() {
      $scope.showNext = true;
      $scope.showSignin = false;
      $scope.showSignup = false;
      $scope.password = null;
      $scope.showPassword = false;
      $scope.showBack = false;
      $scope.step = 'check';
    }
  };

  $scope.submit = function() {
    $scope[$scope.step]();
  };

  $scope.back = function() {
    $scope.go.back();
  };

  $scope.check = function() {
    $scope.spinner = true;
    $.post('/api/users/check', $('form').serialize(), function(data) {
      $scope.step = data.action;
      $scope.go[$scope.step]();
      $scope.spinner = false;
      $scope.$apply();
    });
  };

  $scope.signin = function() {
    $scope.spinner = true;
    $.post('/api/users/sign_in', $('form').serialize(), function(data) {
      $scope.spinner = false;
      $scope.$apply();
      window.location.replace('/');
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
      window.location.replace('/');
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
