(function(){
  $('button[type=reset]').exists(function(button){
    $('button[type=reset]').on('click', function(event) {
      $('[selected]').removeAttr('selected');
      $('#search_seed').removeAttr('value');
    });
  });
}());
