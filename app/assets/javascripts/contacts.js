createCookie = function(){
  var uid = $('#contact_email').val();
  access = new Access();
  access.createCookie(uid);
  return true;
};
