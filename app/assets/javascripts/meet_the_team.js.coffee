$ ->
  $(".profile").hover \
    (-> $(this).children('.name-plate').stop(true, true).slideDown('fast')), \
    (-> $(this).children('.name-plate').stop(true, true).slideUp('fast'))

  $('.bio-link').on 'click', (e) ->
    e.preventDefault()
    $('.bio').hide()
    $(this).parents('.profile').children('.bio').show()

  $('.name-plate').on 'click', (e) ->
    e.preventDefault()
    $('.bio').hide()
    $(this).parents('.profile').children('.bio').show()

  $('.bio').on 'click', (e) ->
    $('.bio').hide()
