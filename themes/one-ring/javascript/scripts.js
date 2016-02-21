(function($) {
$(function () {

    if ($('select').length) {
        $("select").chosen({
            allow_single_deselect: true,
            disable_search_threshold: 12
        });
    }


    if ($('input[type="checkbox"]').length) {
        $('input[type="checkbox"]').checkbox({
            checkedClass: 'fa fa-check-square-o',
            uncheckedClass: 'fa fa-square-o'
        });
    }


    if ($('[data-datepicker]').length) {
        $('[data-datepicker]').datetimepicker({
            pickTime: false
        });
    }

    //$.ajax({
    //    url: $(location).attr('href')+"getsocialfeeds",
    //    dataType: "json",
    //    success: function(data) {
    //        console.log('success');
    //    },
    //    error: function(x,e){
    //        console.log('error');
    //        console.log(x);
    //    }
    //});

    if($('#hotTopics').length > 0){
        $('#hotTopics .loading').show();
        $.ajax({
            url: $(location).attr('href')+"get_feed",
            dataType: "json",
            success: function(data) {alert(data.length);
                for(var i = 0; i < data.length; i++){
                    var type = data[i].type;
                    var type_char = (type == "Twitter")? "@":"/";
                    var picture = data[i].picture;
                    var message = data[i].title;
                    var link = data[i].link;
                    var social_top = '<div class="social-type"><i class="fa fa-'+type.toLowerCase()+'"></i> '+type_char+' Thermann</div>';
                    var social_bottom = '';
                    var background = '';
                    var image = '';
                    var social_button = '';
                    if(type == "Facebook"){
                        social_bottom = social_top;
                        social_top = '';
                        background = 'style="background-image: url('+picture+')"';
                        social_button = '<span class="btn">View post</span>';
                    }else{
                        image = '<img src="'+picture+'" alt="Thermann"/>';
                    }
                    $('.social-feed').append(
                        '<div class="item '+type.toLowerCase()+'">'
                        +'<a href="'+link+'" target="_blank">'
                        + social_top
                        +'<div class="image" '+background+'>'+image+'</div>'
                        +'<div class="text-wrap">'
                        + social_bottom
                        +'<div class="text">'+message+'</div>'
                        +social_button
                        +'</div></div></a>'
                    );
                    if(i == 5){
                        break;
                    }
                }
                $('#hotTopics .loading').slideUp(500,function(){ $(this).remove();});
            },
            error: function(x,e){
                console.log('error');
                console.log(x);
            }
        });
    }


    var $tis = this,
        $wrapper = $('#wrapper'),
        $navMobile,
        etype = $.browser.mobile ? 'touchstart' : 'click';
        w = $(window).innerWidth();


    if (w <= 975 && !$tis.mobMenuFlag) {

        $('body').prepend('<nav class="nav-mobile"><i class="fa fa-times"></i><h2><i class="fa fa-bars"></i>' + $tis.mobileMenuTitle + '</h2><ul></ul></nav>');

        $('.nav-mobile > ul').html($('.nav').html());

        $('.nav-mobile b').remove();

        $('.nav-mobile ul.dropdown-menu').removeClass().addClass("dropdown-mobile");

        //$('.nav-mobile').css({'min-height': ($('#wrapper').height() + 270) + 'px' });

        $navMobile = $(".nav-mobile");

        $("#nav-mobile-btn").bind(etype, function (e) {
            e.stopPropagation();
            e.preventDefault();

            setTimeout(function () {
                $wrapper.addClass('open');
                $navMobile.addClass('open');
                $navMobile.getNiceScroll().show();
            }, 25);

            $(document).bind(etype, function (e) {
                if (!$(e.target).hasClass('nav-mobile') && !$(e.target).parents('.nav-mobile').length) {
                    $wrapper.removeClass('open');
                    $navMobile.removeClass('open');
                    $(document).unbind(etype);
                    $.waypoints('enable');
                }
            });

            $('>i', $navMobile).bind(etype, function () {
                $navMobile.getNiceScroll().hide();
                $wrapper.removeClass('open');
                $navMobile.removeClass('open');
                $(document).unbind(etype);
                $.waypoints('enable');
            });
        });

        $navMobile.niceScroll({
            autohidemode: true,
            cursorcolor: "#c2c2c2",
            cursoropacitymax: "0.7",
            cursorwidth: 10,
            cursorborder: "0px solid #000",
            horizrailenabled: false,
            zindex: "1"
        });

        $navMobile.getNiceScroll().hide();

        $tis.mobMenuFlag = true;
    }

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