require 'test_helper'

class VectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vector = vectors(:one)
  end

  test "should get index" do
    get vectors_url
    assert_response :success
  end

  test "should get new" do
    get new_vector_url
    assert_response :success
  end

  test "should create vector" do
    assert_difference('Vector.count') do
      post vectors_url, params: { vector: { antibiotic_resistance: @vector.antibiotic_resistance, comments: @vector.comments, copy_number: @vector.copy_number, file: @vector.file, name: @vector.name, size: @vector.size, usage: @vector.usage } }
    end

    assert_redirected_to vector_url(Vector.last)
  end

  test "should show vector" do
    get vector_url(@vector)
    assert_response :success
  end

  test "should get edit" do
    get edit_vector_url(@vector)
    assert_response :success
  end

  test "should update vector" do
    patch vector_url(@vector), params: { vector: { antibiotic_resistance: @vector.antibiotic_resistance, comments: @vector.comments, copy_number: @vector.copy_number, file: @vector.file, name: @vector.name, size: @vector.size, usage: @vector.usage } }
    assert_redirected_to vector_url(@vector)
  end

  test "should destroy vector" do
    assert_difference('Vector.count', -1) do
      delete vector_url(@vector)
    end

    assert_redirected_to vectors_url
  end
end
