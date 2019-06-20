// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require turbolinks
//= require_tree .
//= require materialize

document.addEventListener('turbolinks:load', function() {
  var elem0 = document.querySelectorAll('.sidenav');
  var elem1 = document.querySelectorAll('.dropdown-trigger');
  var instance0 = M.Sidenav.init(elem0, { draggable: true });
  var instance1 = M.Dropdown.init(elem1);
});

document.addEventListener("turbolinks:before-cache", function() {
  jQuery('.sidenav').sidenav('destroy');
  jQuery('.dropdown-trigger').dropdown('destroy');
});

$(document).on('turbolinks:load', function(){
  $('select').formSelect();
  $('input#input_text, textarea#textarea').characterCounter();
  $('[data-error]').each(function(key, value){
    var error = $(value).data("error") || [];
    console.log(error);
    M.toast({html: error})
  })
  $('[data-errors]').each(function(key, value){
    var errors = $(value).data("errors") || [];
    errors.forEach(function(error){
      console.log(error);
      M.toast({html: error})
    })
  })
});
