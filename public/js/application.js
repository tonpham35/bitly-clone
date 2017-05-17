function pop_up() {
  $('div#pop-up').show();
};

function pop_off() {
  $('div#pop-up').hide();
};

function addInputListener(){
  // startBtn = document.getElementById('input-box');
  
  // Replace 'functionName' with the name of the function that you have written
  // startBtn.addEventListener("click", pop_up);

  hideBtn = document.getElementById('pop-up');
  
  // Replace 'functionName' with the name of the function that you have written
  hideBtn.addEventListener("click", pop_off);
}

// wait for DOM content to load before binding an event
document.addEventListener('DOMContentLoaded', addInputListener);

$(document).ready(function(){
	// this ID here refers to the form where the usesr types in a URL, you may have a different name for the ID. Edit the code accordingly.
	$('#input-box').submit(function(e){ 
    	e.preventDefault();         
    	$.ajax({
    	  	url: '/urls', //this refers to the route post '/url'
    	  	method: 'post',
    	  	data: $(this).serialize(),
    	  	dataType: 'json',
		    success: function(data){
			   	var resultStr; 
			    $.each(data.reverse(), function(index, value) {
			    	resultStr += 
			    		"<tr>" +
					    	"<td><a href='" + value.long_url + "' target='_blank'>" + value.long_url + "</td>" +
					        "<td><a href='" + value.short_url + "' target='_blank'>" + "http://ton.ly/" + value.short_url + "</td>" +
					        "<td>" + value.click_count + "</td>" +
				        "</tr>"
			    })

    			$('.tablebody').html(resultStr)
    			pop_up()
      			// write some code here to display the shortened URL
     		}
  	 	}); // end of function .ajax
 	}); // end of function .submit

 	// $('#short_link').submit(function(e){ 
  //   	e.preventDefault();         
  //   	$.ajax({
  //   	  	url: '/:short_url', //this refers to the route post '/url'
  //   	  	method: 'get',
  //   	  	data: $(this).serialize(),
  //   	  	dataType: 'json',
		//     success: redirect to data.long_url

  //     			// write some code here to display the shortened URL
  //    		}
  // 	 	}); // end of function .ajax
 	// }); // end of function .submit
}); // end of function document.ready