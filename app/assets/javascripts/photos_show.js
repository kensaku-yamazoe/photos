$(".photo-new-select").on("change",file-field,function(){

  var file = $(this).prop('files')[0];
  var fileReader = new FileReader();

  fileReader.onloadend = function(){
    $('.photo-new-select').append(<div class="photo-new-select"><img class="image-preview" src="${fileReader.result}"></div>);
    append_input()
  }

  fileReader.readAsDataURL(file);
})
