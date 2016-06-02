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
	
})
})(jQuery);