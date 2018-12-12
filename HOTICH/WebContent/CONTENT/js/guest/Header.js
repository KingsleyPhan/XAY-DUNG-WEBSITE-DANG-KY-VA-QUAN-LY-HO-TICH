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
var input = document.getElementById( 'file-upload' );
var infoArea = document.getElementById( 'file-upload-filename' );

input.addEventListener( 'change', showFileName );

function showFileName( event ) {
  
  // the change event gives us the input it occurred in 
  var input = event.srcElement;
  
  // the input has an array of files in the `files` property, each one has a name that you can use. We're just using the name here.
  var fileName = input.files[0].name;
  
  // use fileName however fits your app best, i.e. add it into a div
  infoArea.textContent = 'File name: ' + fileName;
}
