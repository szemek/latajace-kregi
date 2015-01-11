app.controller('FormsController', ['$scope', function($scope){
  $scope.showModal = function() {
    $('.intro').hide();

    $.post('/api/users/check', $('#check form').serialize(), function(data){
      $scope[data.action] = true;
      $scope.$apply();
    });
  };

  $scope.closeModal = function() {
    $('.intro').show();

    $scope.signin = false;
    $scope.signup = false;
  }
}]);
