// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap
//= require modaljs.js

$(document).on('turbolinks:load', function() {


 $('form').onclick('click', '.add_fields', function(event){

   var regexp, time;
   time = new Date().getTime();
   regexp = new RegExp($(this).data('id'), 'g');
   $('.fields').append($(this).data('fields').replace(regexp, time));
   return event.preventDefault();
  });
});
