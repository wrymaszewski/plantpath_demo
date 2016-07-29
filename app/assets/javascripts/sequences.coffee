# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#bacterial_stocks_s').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
jQuery ->
  $('#primers_s').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
jQuery ->
  $('#sequences').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    jQuery ->
  $('#sequence_attachments').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true