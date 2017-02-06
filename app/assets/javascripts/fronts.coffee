# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#pending_resp').dataTable
    bJQueryUI: true
    scrollY: "250px"
    scrollCollapse: true
    paging: false
jQuery ->
  $('#regular_chem').dataTable
    bJQueryUI: true
    scrollY: "250px"
    scrollCollapse: true
    paging: false
jQuery ->
  $('#mol_biol_chem').dataTable
    bJQueryUI: true
    scrollY: "250px"
    scrollCollapse: true
    paging: false

