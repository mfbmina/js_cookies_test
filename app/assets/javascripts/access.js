class Access {
  constructor() {
    this.uid = this.getUid();
    this.url = window.location.href;
    this.accessTime = new Date().toUTCString();
  }

  createCookie() {
    document.cookie = "uid=" + this.uid;
    document.cookie = "url=" + this.url;
    document.cookie = "accessTime=" + this.accessTime;
    var params = { cookie: { uid: this.uid, url: this.url, accessTime: this.accessTime } };
    $.ajax({
      type: "POST",
      contentType: "application/json",
      url: "/api/cookies",
      data: JSON.stringify(params),
      dataType: "json"
    }).done(function() {
      console.log("success");
    }).fail(function() {
      console.log("error");
    });
  }

  getUid() {
    var uid = this.getCookie('uid');
    if (uid === '') {
      uid = this.generateUid();
    }
    return uid;
  }

  generateUid() {
  	var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
  	var stringLength = 32;
  	var randomstring = '';
  	for (var i=0; i < stringLength; i++) {
  		var rnum = Math.floor(Math.random() * chars.length);
  		randomstring += chars.substring(rnum, rnum+1);
  	}
    return randomstring;
  }

  getCookie(cookieName) {
    var name = cookieName + "=";
    var cookieArray = document.cookie.split(';');
    for (var i = 0; i < cookieArray.length; i++) {
      var c = cookieArray[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
  }
}
