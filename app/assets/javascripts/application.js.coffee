#= require jquery
#= require jquery_ujs
#= require moment
#= require moment/ru
#= require bootstrap-datetimepicker
#= require pickers
#= require ckeditor/init
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
  $backgrounds = $('div.background')
  $backgrounds.hide()
  current_background_index = 0
  $backgrounds.eq(current_background_index).show()
  if window.location.href.indexOf('page') > -1
    $('#background_4').show()
  else
    setInterval (->
      $backgrounds.eq(current_background_index).fadeOut(500)
      if current_background_index == $backgrounds.length - 1
        current_background_index = 0
      else
        current_background_index++
      $backgrounds.eq(current_background_index).fadeIn(500)), 5000

  init_blank_adding = ->
    $('.blank').prop('target', '_blank')
  init_blank_adding()

  $('input.date_picker').click ->
    $(this).parents('div').children('span').trigger 'click'
    $('bootstrap-datetimepicker-widget').show()
