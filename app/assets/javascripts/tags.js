(function(){
  $('#profile_skill_list, #profile_interest_list').exists(function(){
    var tagify = function(selector, tags) {
      $(selector).select2({tags: tags});

      $(selector).on("change", function() {
        $(selector + '_val').html($(selector).val());
      });

      $(selector).select2('container').find("ul.select2-choices").sortable({
        containment: 'parent',
        start: function() { $(selector).select2("onSortStart"); },
        update: function() { $(selector).select2("onSortEnd"); }
      });
    };

    tagify('#profile_skill_list', gon.tags);
    tagify('#profile_interest_list', gon.tags);
  });
}());
