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

  init_place_form = ->
    $municipality_select = $('.participant_municipality')
    $locality_select = $('.participant_locality')
    $municipality_select.hide()
    $locality_select.hide()
    $state_select = $('#participant_region')
    $state_select.change ->
      if $(this).val() == 'Ульяновская область'
        $locality_select.slideDown()
        $municipality_select.slideDown()
      else
        $locality_select.slideUp()
        $municipality_select.slideUp()
      return
    return

  init_place_form()
  return
