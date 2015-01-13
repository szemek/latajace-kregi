app.controller('FormsController', ['$scope', function($scope){
  $scope.showModal = function() {
    $('.intro').hide();

    $scope.modal = true;
  };

  $scope.closeModal = function() {
    $('.intro').show();

    $scope.modal = false;
  };
}]);
