(function($) {
$(function () {
    
// Pagination
    if ($('.pagination').length) {
        var paginate = function (url) {
            var param = '&ajax=1',
                ajaxUrl = (url.indexOf(param) === -1) ?
                    url + '&ajax=1' :
                    url,
                cleanUrl = url.replace(new RegExp(param+'$'),'');

            $.ajax(ajaxUrl)
                .done(function (response) {
                    $('.main').html(response);
                    $('html, body').animate({
                        scrollTop: $('.main').offset().top
                    });
                    window.history.pushState(
                        {url: cleanUrl},
                        document.title,
                        cleanUrl
                    );
                })
                .fail (function (xhr) {
                alert('Error: ' + xhr.responseText);
            });
        };

        $('.main').on('click','.pagination a', function (e) {
            e.preventDefault();
            var url = $(this).attr('href');
            paginate(url);
        });

        window.onpopstate = function(e) {
            if (e.state.url) {
                paginate(e.state.url);
            }
            else {
                e.preventDefault();
            }
        };
    }

    $("#Form_ServiceForm_Address").geocomplete({
        country: 'AUS',
        details: "form",
        detailsAttribute: "data-geo",
        type: ["postal_code", "establishment"]
    });

    $("input.password").addClass("form-control");
    $("#MemberLoginForm_LoginForm_Email").addClass("form-control");
    $("#MemberLoginForm_LoginForm_action_dologin").addClass("btn btn-primary btn-block");
    $("#MemberLoginForm_LostPasswordForm_Email").addClass("form-control");
    $("#MemberLoginForm_LostPasswordForm_action_forgotPassword").addClass("btn btn-primary btn-block");


    $( "#slider" ).slider({
        value:20,
        min: 0,
        max: 100,
        step: 10,
        slide: function( event, ui ) {
            $( "#Form_SearchForm_Distance" ).val( ui.value );
        }
    });
    $( "#Form_SearchForm_Distance" ).val( $( "#slider" ).slider( "value" ) );

})
})(jQuery);