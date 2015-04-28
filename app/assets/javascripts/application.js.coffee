#= require jquery
#= require jquery_ujs
#= require moment
#= require moment/ru
#= require bootstrap-datetimepicker
#= require pickers
#= require_tree .

$ ->
  $('.datetimepicker').datetimepicker()
  $('.datepicker').datetimepicker()
  $('.link').click ->
    location.href = $(this).attr('data-href')
  inner_height = $('.inner.cover').height()
  window_height = $(window).height()
  if window_height - inner_height > 300
    $('.masthead.clearfix').css('position', 'fixed')
    $('.mastfoot').css('position', 'fixed')
