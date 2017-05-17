$(document).ready(function(){
  // this ID here refers to the form where the usesr types in a URL, you may have a different name for the ID. Edit the code accordingly.
  $('#url-form').submit(function(e){ 
    e.preventDefault();         
    $.ajax({
      url: '/url', //this refers to the route post '/url'
      method: 'POST',
      data: $(this).serialize(),
      dataType: 'json'      
      },
     success: function(data){
      // write some code here to display the shortened URL
     }
    }); // end of function .ajax
  }); // end of function .submit
}); // end of function document.ready