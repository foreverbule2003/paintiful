// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require masonry/jquery.masonry
//= require masonry/jquery.imagesloaded.min
//= require masonry/jquery.infinitescroll.min
//= require imagesloaded
//= require turbolinks
//= require bootstrap/alert
//= require_tree .




$(document).on('page:update',function(){
  console.log("page load")
  load_posts();
});

$(window).resize(function () {
  masonry();
});


function masonry(){
  $(function(){
    $('#masonry-container').masonry({
      itemSelector: '.post',
      gutterWidth: 0
    });
  });
}

function delay_masonry(){
  setTimeout(function () { 
    masonry();
  }, 500)
}

function load_posts(){
  $('#masonry-container').hide()
  delay_masonry();
  $('#masonry-container').fadeIn(1500);
}