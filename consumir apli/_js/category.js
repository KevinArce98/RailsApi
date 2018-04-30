var CATEGORY = CATEGORY ||{

  getCategories: function () {
    // categorias
    $.ajax({
      url: 'http://localhost:3000/v1/categories',
      type: 'GET',
      contentType: 'application/json',
      headers: { 'AUTHORIZATION':localStorage.getItem("token")},
      success: function(data){
        $('#update').hide();
        $('#cupdate').hide();
        var miArray = data;
        miArray.forEach( function(data, indice, array) {
          $('#categories').append( "<p id="+data.id+" onclick='CATEGORY.setCategory(this);'>"+data.description+"</p> <button id="+data.id+" onclick='CARD.getCards(this);' type='button' name='button'>Show Cards</button> <br>" );
        })
      },
      error: function(){
        alert('error');
      }
    });

  },

  // CREAR CATEGORIES
  createCategory: function () {
    $.ajax({
      url: 'http://localhost:3000/v1/categories',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify( {category:{description: $('#desc').val()}} ),
      headers: { 'AUTHORIZATION': localStorage.getItem("token")},
      success: function(data){
        $('#categories').append( "<p id="+data.id+" onclick='CATEGORY.setCategory(this);'>"+data.description+"</p> <button id="+data.id+" onclick='CARD.getCards(this);' type='button' name='button'>Show Cards</button> <br>" );
        $('#desc').val('');
      },
      error: function(){
        alert('error');
      }
    });
  },

  // BUSCAR CATEGORY  - dar click a la categorias
  setCategory: function (e) {
    $.ajax({
      url: 'http://localhost:3000/v1/categories/'+e.id,
      type: 'GET',
      contentType: 'application/json',
      headers: { 'AUTHORIZATION': localStorage.getItem("token")},
      success: function(data){
        $('#update').show();
        $('#create').hide();
        $('#ca_id').val(data.id);
        $('#desc').val(data.description);
      },
      error: function(){
        alert('error');
      }
    });
  },

  // MODIFICAR CATEGORIA
  updateCategory: function () {
    parseInt($('#ca_id').val())
    $.ajax({
      url: 'http://localhost:3000/v1/categories/'+$('#ca_id').val(),
      type: 'PUT',
      contentType: 'application/json',
      data: JSON.stringify({category:{id:$('#ca_id').val(), description: $('#desc').val()}}) ,
      headers: { 'AUTHORIZATION': localStorage.getItem("token")},
      success: function(data){
        alert("OK");
        $("#"+data.id).text(data.description);
        $('#ca_id').val('');
        $('#desc').val('');
        $('#update').hide();
        $('#create').show();
      },
      error: function(){
        alert('error');
      }
    });

  },

}
