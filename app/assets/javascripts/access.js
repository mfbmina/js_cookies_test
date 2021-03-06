class Access {
  constructor() {
  }

  createCookie(uid) {
    document.cookie = "uid=" + uid + ";path=/";
    this.updateCookie();
  }

  updateCookie() {
    document.cookie = "url=" + window.location.href + ";path=/";
    document.cookie = "accessTime=" + new Date().toUTCString() + ";path=/";
  }

  register() {
    if (this.getCookie('uid') === '') {
      return;
    }
    var params = {
      uid: this.getCookie('uid'),
      cookie: {
        url: this.getCookie('url'),
        accessTime: this.getCookie('accessTime')
      }
    };
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
