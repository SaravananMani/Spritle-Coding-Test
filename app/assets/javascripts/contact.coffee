# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "click", "#add_address", (e) ->
  e.preventDefault();
  count = $('.address-count').length + 1;
  #Ajax
  $.ajax
    url: '/contact/add_address',
    data: {address_count : count}
    success: (data) ->
      $('#add_address_fields').append("<hr />")
      $('#add_address_fields').append($(data).find('div#add_address_fields').html())
    error: (data) ->
      alert "Sorry, There Was An Error!"


$(document).on "click", "#add_communication", (e) ->
  e.preventDefault();
  count = $('.communication-count').length + 1;
  #Ajax
  $.ajax
    url: '/contact/add_communication',
    data: {communication_count : count}
    success: (data) ->
      $('#add_communications_fields').append("<hr />")
      $('#add_communications_fields').append($(data).find('div#add_communications_fields').html())
    error: (data) ->
      alert "Sorry, There Was An Error!"
