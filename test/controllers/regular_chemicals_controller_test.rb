require 'test_helper'

class RegularChemicalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @regular_chemical = regular_chemicals(:one)
  end

  test "should get index" do
    get regular_chemicals_url
    assert_response :success
  end

  test "should get new" do
    get new_regular_chemical_url
    assert_response :success
  end

  test "should create regular_chemical" do
    assert_difference('RegularChemical.count') do
      post regular_chemicals_url, params: { regular_chemical: { catalogue_number: @regular_chemical.catalogue_number, comments: @regular_chemical.comments, delivery_date: @regular_chemical.delivery_date, formula: @regular_chemical.formula, full_name: @regular_chemical.full_name, producer: @regular_chemical.producer, short_name: @regular_chemical.short_name } }
    end

    assert_redirected_to regular_chemical_url(RegularChemical.last)
  end

  test "should show regular_chemical" do
    get regular_chemical_url(@regular_chemical)
    assert_response :success
  end

  test "should get edit" do
    get edit_regular_chemical_url(@regular_chemical)
    assert_response :success
  end

  test "should update regular_chemical" do
    patch regular_chemical_url(@regular_chemical), params: { regular_chemical: { catalogue_number: @regular_chemical.catalogue_number, comments: @regular_chemical.comments, delivery_date: @regular_chemical.delivery_date, formula: @regular_chemical.formula, full_name: @regular_chemical.full_name, producer: @regular_chemical.producer, short_name: @regular_chemical.short_name } }
    assert_redirected_to regular_chemical_url(@regular_chemical)
  end

  test "should destroy regular_chemical" do
    assert_difference('RegularChemical.count', -1) do
      delete regular_chemical_url(@regular_chemical)
    end

    assert_redirected_to regular_chemicals_url
  end
end
