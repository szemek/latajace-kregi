app.controller('FormsController', ['$scope', function($scope){
  $scope.showModal = function() {
    $scope.modal = true;
  };

  $scope.closeModal = function() {
    $scope.modal = false;
  }
}]);
