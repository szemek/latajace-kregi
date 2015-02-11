app.controller('FormsController', ['$scope', '$translate', function($scope, $translate) {
  $scope.showEmail = true;
  $scope.showNext = true;
  $scope.hiddenPassword = true;
  $scope.step = 'check';

  $scope.showModal = function() {
    $('.intro').hide();

    $scope.modal = true;

    _.delay(function() {
      $('#check #user_email').focus();
    }, 300);
  };

  $scope.showPasswordText = function() {
    $('#user_password').attr('type', 'text');
    $scope.hiddenPassword = false;
  };

  $scope.hidePasswordText = function() {
    $('#user_password').attr('type', 'password');
    $scope.hiddenPassword = true;
  };

  $scope.submit = function() {
    $scope[$scope.step]();
  };

  $scope.back = function() {
    $scope.step = 'check';
  };

  $scope.check = function() {
    $scope.spinner = true;
    $.post('/api/users/check', $('form#check').serialize(), function(data) {
      $scope.step = data.action;
      $scope.spinner = false;
      $scope.$apply();
      $('#step #user_password'.replace('step', data.action)).focus();
    });
  };

  $scope.signin = function() {
    $scope.spinner = true;
    $.post('/api/users/sign_in', $('form#signin').serialize(), function(data) {
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
    $.post('/api/users', $('form#signup').serialize(), function(data) {
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
  };

  $scope.reset = function() {
    $scope.step = 'reset';
  };

  $scope.sendInstructions = function() {
    $scope.spinner = true;
    $.post('/api/users/password', $('form#reset').serialize(), function(data) {
      $scope.spinner = false;
      $scope.$apply();
      $('.info').addClass('show').delay(5000).queue(function(){
        $(this).removeClass('show').dequeue();
      });
    }, 'json').fail(function(data) {
      $scope.spinner = false;
      $scope.$apply();
    });
  };

  $scope.changePassword = function() {
    $scope.spinner = true;
    $.post('/api/users/password', $('form#set').serialize(), function(argument) {
      $scope.spinner = false;
      $scope.$apply();
      window.location.replace('/');
    });
  };

  $scope.closeModal = function() {
    $('.intro').show();

    $scope.modal = false;
  };
}]);
