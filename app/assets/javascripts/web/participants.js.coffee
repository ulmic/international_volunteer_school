$ ->
  $activity_line_select = $('select#participant_activity_line').first()
  $activity_line_another= $('input#participant_another_line').first()

  $activity_line_another.hide()

  $activity_line_select.change ->
    if $activity_line_select.children('option').size() == $activity_line_select.prop('selectedIndex') + 1
      $activity_line_another.slideDown()
    else
      $activity_line_another.slideUp()
    return
  return
