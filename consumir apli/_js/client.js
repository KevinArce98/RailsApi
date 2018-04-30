var CLIENT = CLIENT ||{

  // cards
  getClients: function (e) {
    $('#client_id').val();
    $.ajax({
      url: 'http://localhost:3000/clients/',
      type: 'GET',
      contentType: 'application/json',
      // headers: { 'AUTHORIZATION':localStorage.getItem("token")},
      success: function(data){
        var miArray = data;
        $('#clients').html("");
        miArray.forEach( function(data, indice, array) {
          $('#clients').append( "<p id="+data.id+" onclick='CARD.setCategory(this);'>"+data.name +"/"+ data.legal_number +"</p> <button id="+data.id+" onclick='CARD.deleteCard();' type='button' name='button'>Delete Cards</button> <br>" );
        })
      },
      error: function(){
        alert('error');
      }
    });

  },

  // CREAR cards
  createCard: function () {
    $.ajax({
      url: 'http://localhost:3000/v1/users',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({card:{tittle:$('#tittle').val(),description:$('#cdesc').val(), category_id:$('#id_c').val()}} ),
      headers: { 'AUTHORIZATION': localStorage.getItem("token")},
      success: function(data){
        $('#cards').append( "<p id="+data.id+" onclick='CARD.setCard(this);'>"+data.tittle +"/"+ data.description +"</p> <button id="+data.id+" onclick='CARD.deleteCard();' type='button' name='button'>Delete Cards</button> <br>" );
        $('#cdesc').val('');
        $('#tittle').val('');
      },
      error: function(){
        alert('error');
      }
    });
  },


}
