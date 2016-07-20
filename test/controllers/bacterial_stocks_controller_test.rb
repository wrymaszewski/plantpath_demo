require 'test_helper'

class BacterialStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bacterial_stock = bacterial_stocks(:one)
  end

  test "should get index" do
    get bacterial_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_bacterial_stock_url
    assert_response :success
  end

  test "should create bacterial_stock" do
    assert_difference('BacterialStock.count') do
      post bacterial_stocks_url, params: { bacterial_stock: { antibiotic_resistance: @bacterial_stock.antibiotic_resistance, comments: @bacterial_stock.comments, insert: @bacterial_stock.insert, methods_of_cloning: @bacterial_stock.methods_of_cloning, number: @bacterial_stock.number, plasmid: @bacterial_stock.plasmid, references: @bacterial_stock.references, source: @bacterial_stock.source, species: @bacterial_stock.species, strain: @bacterial_stock.strain, tag: @bacterial_stock.tag } }
    end

    assert_redirected_to bacterial_stock_url(BacterialStock.last)
  end

  test "should show bacterial_stock" do
    get bacterial_stock_url(@bacterial_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_bacterial_stock_url(@bacterial_stock)
    assert_response :success
  end

  test "should update bacterial_stock" do
    patch bacterial_stock_url(@bacterial_stock), params: { bacterial_stock: { antibiotic_resistance: @bacterial_stock.antibiotic_resistance, comments: @bacterial_stock.comments, insert: @bacterial_stock.insert, methods_of_cloning: @bacterial_stock.methods_of_cloning, number: @bacterial_stock.number, plasmid: @bacterial_stock.plasmid, references: @bacterial_stock.references, source: @bacterial_stock.source, species: @bacterial_stock.species, strain: @bacterial_stock.strain, tag: @bacterial_stock.tag } }
    assert_redirected_to bacterial_stock_url(@bacterial_stock)
  end

  test "should destroy bacterial_stock" do
    assert_difference('BacterialStock.count', -1) do
      delete bacterial_stock_url(@bacterial_stock)
    end

    assert_redirected_to bacterial_stocks_url
  end
end
