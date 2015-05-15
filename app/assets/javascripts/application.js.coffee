#= require jquery
#= require jquery_ujs
#= require moment
#= require moment/ru
#= require bootstrap-datetimepicker
#= require pickers
#= require_tree .

$ ->
  change_background = ->

  $('.datetimepicker').datetimepicker()
  $('.datepicker').datetimepicker()
  $('.link').click ->
    location.href = $(this).attr('data-href')
  inner_height = $('.inner.cover').height()
  window_height = $(window).height()
  if window_height - inner_height > 300
    $('.masthead.clearfix').css('position', 'fixed')
    $('.mastfoot').css('position', 'fixed')
  $backgrounds = $('div.background')
  $backgrounds.hide()
  current_background_index = 0
  $backgrounds.eq(current_background_index).show()
  setInterval (->
    $backgrounds.eq(current_background_index).fadeOut(500)
    if current_background_index == $backgrounds.length - 1
      current_background_index = 0
    else
      current_background_index++
    $backgrounds.eq(current_background_index).fadeIn(500)), 5000
