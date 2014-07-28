// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree ../../../vendor/assets/javascripts/.
//= require_tree .

$(function () {
  $("ul.controller>li").bind("click", function(e) {
    $(".actions").css("display","none");
    $(this).children(".actions").css("display","block");
  });

  $(".image_file img").bind("click", function(e) {
    id = $(".image_file").data("id");
    $.ajax({
      url: "/image_banners/increase_count",
      type: "post",
      dataType: "json",
      data: { id: id}
    });
  });

  var prevState = null;
  var prevVal   = null;
  $("input[type = 'radio']").bind("click", function () {
    if (prevState == null) {
      prevState = 1;
      prevVal   = $(this);
    } else {
      prevState = null;
      prevVal.prop('checked', false);
    }
  });
});