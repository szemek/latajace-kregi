//= require jcrop

function Cropper(selector) {
  $(selector).Jcrop({
    aspectRatio: 1,
    setSelect: [100, 100, 300, 300],
    onSelect: this.update,
    onChange: this.update
  });
}

Cropper.prototype.update = function(coordinates) {
  var image = document.querySelector('#image');
  var image_width = image.width;
  var image_height = image.height;

  var holder = $('.jcrop-holder');
  var holder_width = holder.width();
  var holder_height = holder.height();

  var width_ratio = holder_width / image_width;
  var height_ratio = holder_height / image_height;

  $('#profile_photo_crop_x').val(coordinates.x / width_ratio);
  $('#profile_photo_crop_y').val(coordinates.y / height_ratio);
  $('#profile_photo_crop_w').val(coordinates.w / width_ratio);
  $('#profile_photo_crop_h').val(coordinates.h / height_ratio);
};

(function(){
  $('#profile_photo').exists(function() {
    function setPreview(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
          var image = $('<img>')
          image.attr('src', e.target.result);
          image.attr('id', 'image');

          $('.preview').html(image);

          new Cropper('.preview img');
        }

        reader.readAsDataURL(input.files[0]);
      }
    }

    $("#profile_photo").change(function() {
      setPreview(this);
    });
  });
}());

