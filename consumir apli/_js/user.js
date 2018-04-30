var USER = USER ||{
  // login user
  login: function () {
    $.ajax({
      url: 'http://localhost:3000/v1/sessions',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify( {username:$('#username').val(),password: $('#password').val(),} ),
      success: function(data){
        alert( 'ok');
        localStorage.setItem("token", data);
        window.location.replace("categories.html");
      },
      error: function(){
        alert('error');
      }
    });
  },

  // CREAR USUARIO
  crearUsuario: function () {
    $.ajax({
      url: 'http://localhost:3000/v1/users',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify( {user:{username:$('#nusername').val(),password: $('#npassword').val(),pasword_confirmation: $('#npassword_confirmation').val()}} ),
      success: function(data){
        alert( 'Ya puedes iniciar session');

      },
      error: function(){
        alert('error');
      }
    });
  },

}
