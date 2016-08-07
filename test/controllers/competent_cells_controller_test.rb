require 'test_helper'

class CompetentCellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competent_cell = competent_cells(:one)
  end

  test "should get index" do
    get competent_cells_url
    assert_response :success
  end

  test "should get new" do
    get new_competent_cell_url
    assert_response :success
  end

  test "should create competent_cell" do
    assert_difference('CompetentCell.count') do
      post competent_cells_url, params: { competent_cell: { antibiotic_resistance: @competent_cell.antibiotic_resistance, comments: @competent_cell.comments, place: @competent_cell.place, species: @competent_cell.species, strain: @competent_cell.strain, usage: @competent_cell.usage } }
    end

    assert_redirected_to competent_cell_url(CompetentCell.last)
  end

  test "should show competent_cell" do
    get competent_cell_url(@competent_cell)
    assert_response :success
  end

  test "should get edit" do
    get edit_competent_cell_url(@competent_cell)
    assert_response :success
  end

  test "should update competent_cell" do
    patch competent_cell_url(@competent_cell), params: { competent_cell: { antibiotic_resistance: @competent_cell.antibiotic_resistance, comments: @competent_cell.comments, place: @competent_cell.place, species: @competent_cell.species, strain: @competent_cell.strain, usage: @competent_cell.usage } }
    assert_redirected_to competent_cell_url(@competent_cell)
  end

  test "should destroy competent_cell" do
    assert_difference('CompetentCell.count', -1) do
      delete competent_cell_url(@competent_cell)
    end

    assert_redirected_to competent_cells_url
  end
end
