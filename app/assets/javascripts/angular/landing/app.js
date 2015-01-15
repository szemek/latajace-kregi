var app = angular.module('landing', ['pascalprecht.translate']);

app.config(['$translateProvider', function ($translateProvider) {
  $translateProvider.translations('en', {
    password: 'Password',
    password_confirmation: 'Password'
  });

  $translateProvider.translations('pl', {
    password: 'Hasło',
    password_confirmation: 'Hasło'
  });

  $translateProvider.preferredLanguage('pl');
}]);
