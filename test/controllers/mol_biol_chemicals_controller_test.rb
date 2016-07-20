require 'test_helper'

class MolBiolChemicalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mol_biol_chemical = mol_biol_chemicals(:one)
  end

  test "should get index" do
    get mol_biol_chemicals_url
    assert_response :success
  end

  test "should get new" do
    get new_mol_biol_chemical_url
    assert_response :success
  end

  test "should create mol_biol_chemical" do
    assert_difference('MolBiolChemical.count') do
      post mol_biol_chemicals_url, params: { mol_biol_chemical: { catalogue_number: @mol_biol_chemical.catalogue_number, delivery_date: @mol_biol_chemical.delivery_date, name: @mol_biol_chemical.name, producer: @mol_biol_chemical.producer, quantity: @mol_biol_chemical.quantity } }
    end

    assert_redirected_to mol_biol_chemical_url(MolBiolChemical.last)
  end

  test "should show mol_biol_chemical" do
    get mol_biol_chemical_url(@mol_biol_chemical)
    assert_response :success
  end

  test "should get edit" do
    get edit_mol_biol_chemical_url(@mol_biol_chemical)
    assert_response :success
  end

  test "should update mol_biol_chemical" do
    patch mol_biol_chemical_url(@mol_biol_chemical), params: { mol_biol_chemical: { catalogue_number: @mol_biol_chemical.catalogue_number, delivery_date: @mol_biol_chemical.delivery_date, name: @mol_biol_chemical.name, producer: @mol_biol_chemical.producer, quantity: @mol_biol_chemical.quantity } }
    assert_redirected_to mol_biol_chemical_url(@mol_biol_chemical)
  end

  test "should destroy mol_biol_chemical" do
    assert_difference('MolBiolChemical.count', -1) do
      delete mol_biol_chemical_url(@mol_biol_chemical)
    end

    assert_redirected_to mol_biol_chemicals_url
  end
end
