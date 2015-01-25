adjust_form_options = (inquiry_type) ->
  if inquiry_type == ''
    $('.contact_company').hide()
    $('.contact_role').hide()
    $('.contact_website').hide()
    $('.contact_notes').hide()
    $('.contact_name').hide()
    $('.contact_email').hide()
    $('#contact .submit-form').hide()

  if inquiry_type == 'Web services for my non-profit'
    $('.contact_company').show()
    $('.contact_role').hide()
    $('.contact_website').hide()
    $('.contact_notes').show()
    $('.contact_name').show()
    $('.contact_email').show()
    $('#contact .submit-form').show()

  if inquiry_type == 'Volunteering with Devs for Change'
    $('.contact_company').hide()
    $('.contact_role').show()
    $('.contact_website').show()
    $('.contact_notes').hide()
    $('.contact_name').show()
    $('.contact_email').show()
    $('#contact .submit-form').show()


  if inquiry_type == 'General Information'
    $('.contact_company').hide()
    $('.contact_role').hide()
    $('.contact_website').hide()
    $('.contact_notes').show()
    $('.contact_name').show()
    $('.contact_email').show()
    $('#contact .submit-form').show()


$ ->
  adjust_form_options($('#contact_inquiry_type').val())

  $('#contact_inquiry_type').change ->
    adjust_form_options($('#contact_inquiry_type').val())
