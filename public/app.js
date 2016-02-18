$('.to-products').on('click', function(el) {
  el.preventDefault();

  var space = $('#space').val();
  var token = $('#token').val();
  var content_type = $('#content_type').val();

  var url = "/space/" + space + "/token/" + token + "/content_type/" + content_type;

  window.location.href = url;
});
