$(document).on('ready page:load', function() {

    
  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();
    $.getScript('/products?search=' + searchValue);
  });


    $("#new_review")
        .on('ajax:beforeSend', function() { // set this code to happen just before the ajax request is made
            $("input[type='submit']") // make changes to the submit button
		.val('Saving...') // change the text on the button
		.attr('disabled', 'disabled'); // disable the button
        })
        .on('ajax:complete', function() {
            $("input[type='submit']")
		.val('Create Review')
		.removeAttr('disabled');
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
