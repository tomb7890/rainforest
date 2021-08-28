$(document).on('ready page:load', function() {

    
  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();
    $.getScript('/products?search=' + searchValue)

      .done(function( script, textStatus ) {
	$button = $('#products-search-button')
	$.rails.enableElement($button)
	$button.removeAttr('disabled')
      })
    
      .fail(function( jqxhr, settings, exception ) {
	console.log("product search triggered ajaxError handler.");
      });

  });

  
});


// $(window).scroll(function() {
//     var url = $('.pagination span.next').children().attr('href');
//     if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50)
//     {
//         $('.pagination').text("Fetching more products...");
//         return $.getScript(url);
//     }
// });
