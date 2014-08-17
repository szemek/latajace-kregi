(function(){
  $('#profile_skill_list').tagit({
    singleField: true,
    singleFieldNode: $('#profile_skill_list'),
    allowSpaces: true,
    autocomplete: {
      delay: 0,
      minLength: 2,
      source: '/tags.json'
    }
  });

  $('#profile_interest_list').tagit({
    availableTags: ['ala', 'ma', 'kota'],
    singleField: true,
    singleFieldNode: $('#profile_interest_list'),
    allowSpaces: true
  });
}());
