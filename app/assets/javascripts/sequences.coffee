# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#bacterial_stocks_s').dataTable
    bJQueryUI: true
    scrollY: "250px"
    scrollX: true
    scrollCollapse: true
    paging: false
jQuery ->
  $('#primers_s').dataTable
    bJQueryUI: true
    scrollY: "250px"
    scrollX: true
    scrollCollapse: true
    paging: false
jQuery ->
  $('#sequences').dataTable
    bJQueryUI: true
    scrollY: "250px"
    scrollCollapse: true
    paging: false
    jQuery ->
  $('#sequence_attachments').dataTable
    bJQueryUI: true
    scrollY: "250px"
    scrollCollapse: true
    paging: false