var set_height;
var h;

set_height = function () {
    $('.header').each(function () {
        // lấy height của chính nó
        var el_height = $(this).height();
        h = $(this).height();
        // gán height cho element
        $(this).css('height', el_height);
    });
}

$(window).on('load resize', function () {
    document.getElementById("id-content").style.paddingTop = $('.header').height() + 'px';

    
});
window.onscroll = function () { scrollFunction() };

function scrollFunction() {
    if (document.documentElement.scrollTop > 60) {
     
        document.getElementById("id-header").style.height = "50px";
        document.getElementById("id-logo-text").style.fontSize = "30px";
        document.getElementById("id-logo-text").style.lineHeight="50px";
    } 
    else {
        document.getElementById("id-header").style.height = "90px";
        document.getElementById("id-logo-text").style.fontSize = "36px";
        document.getElementById("id-logo-text").style.lineHeight="90px";
    }
}
