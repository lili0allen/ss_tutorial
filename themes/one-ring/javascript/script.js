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

    //service entry address geo complete
    $("#Form_ServiceForm_Address").geocomplete({
        country: 'AUS',
        details: "form",
        detailsAttribute: "data-geo",
        type: ["postal_code", "establishment"]
    });

    //form styles
    $("input.password").addClass("form-control");
    $("#MemberLoginForm_LoginForm_Email").addClass("form-control");
    $("#MemberLoginForm_LoginForm_action_dologin").addClass("btn btn-primary btn-block");
    $("#MemberLoginForm_LostPasswordForm_Email").addClass("form-control");
    $("#MemberLoginForm_LostPasswordForm_action_forgotPassword").addClass("btn btn-primary btn-block");

    //service search distance slider
    $( "#slider" ).slider({
        value: $( "#Form_SearchForm_Distance" ).val(),
        min: 0,
        max: 100,
        step: 10,
        slide: function( event, ui ) {
            $( "#Form_SearchForm_Distance" ).val( ui.value );
        }
    });
    $( "#Form_SearchForm_Distance" ).val( $( "#slider" ).slider( "value" ) );

    //service search postcode typeahead
    $('.typeahead').typeahead({
        source: function (query, process) {
            return $.get('/api/v1/PostcodesGeo', { Postcode: query }, function (xml) {
                var newData = [];
                    $(xml).find('PostcodesGeo').each(function() {
                        newData.push($(this).find('Suburb').text()+' '+$(this).find('Postcode').text()+', '+$(this).find('State').text());
                    });

                return process(newData);
            });
        },
        minLength: 3
    });

    //service search postcode validation
    $.validator.addMethod("postcode", function(value, element)
    {
        return this.optional(element) || /^[a-zA-Z\s]+[0-9\s]+,[A-Z\s]{3,4}$/i.test(value);
    }, "Please enter a valid postcode and suburb");

    $("#Form_SearchForm").validate({
        rules: {
            Postcode: "postcode"
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

    //add to wishlist
    $(".add-to-wishlist").click(function () {
        var wishlistCookie = getCookie("wishlist");
        var serviceCode = $(this).data('id');
        if (wishlistCookie){
            var serviceArray = new Array();
            serviceArray = wishlistCookie.split(",");
            if($.inArray(serviceCode.toString(),serviceArray)=="-1"){
                serviceArray.push(serviceCode);
                document.cookie = 'wishlist='+serviceArray.toString()+'; expires=Fri, 1 Jan 2031 00:00:01 UTC; path=/';
                // $(this).html("REMOVE").addClass("remove-from-wishlist").removeClass("add-to-wishlist");

            }else{
                return false;
            }
        }else{
            document.cookie = 'wishlist='+serviceCode+'; expires=Fri, 1 Jan 2031 00:00:01 UTC; path=/';
        }
        updateWishlistCount();
    });

    updateWishlistCount();
    function updateWishlistCount() {
        var wishlistCookie = getCookie("wishlist");
        if(wishlistCookie){
            var serviceArray = wishlistCookie.split(",");
            $("#wishlist-count").html(serviceArray.length);
        }

    }


    function getCookie(cookiename) {
        var name = cookiename + "=";
        var cookies = document.cookie.split(';');
        for(var i=0; i<cookies.length; i++){
            var trimmed = cookies[i].trim();
            if (trimmed.indexOf(name)==0) {
                var encodedValue = trimmed.substring(name.length,trimmed.length);
                return decodeURIComponent(encodedValue);
            }
        }
        return "";
    }


})
})(jQuery);