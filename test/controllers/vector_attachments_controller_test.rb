require 'test_helper'

class VectorAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vector_attachment = vector_attachments(:one)
  end

  test "should get index" do
    get vector_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_vector_attachment_url
    assert_response :success
  end

  test "should create vector_attachment" do
    assert_difference('VectorAttachment.count') do
      post vector_attachments_url, params: { vector_attachment: { file: @vector_attachment.file, name: @vector_attachment.name, type: @vector_attachment.type, vector_id: @vector_attachment.vector_id } }
    end

    assert_redirected_to vector_attachment_url(VectorAttachment.last)
  end

  test "should show vector_attachment" do
    get vector_attachment_url(@vector_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_vector_attachment_url(@vector_attachment)
    assert_response :success
  end

  test "should update vector_attachment" do
    patch vector_attachment_url(@vector_attachment), params: { vector_attachment: { file: @vector_attachment.file, name: @vector_attachment.name, type: @vector_attachment.type, vector_id: @vector_attachment.vector_id } }
    assert_redirected_to vector_attachment_url(@vector_attachment)
  end

  test "should destroy vector_attachment" do
    assert_difference('VectorAttachment.count', -1) do
      delete vector_attachment_url(@vector_attachment)
    end

    assert_redirected_to vector_attachments_url
  end
end
