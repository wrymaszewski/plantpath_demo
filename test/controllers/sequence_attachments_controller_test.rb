require 'test_helper'

class SequenceAttachmentsControllerTest < ActionController::TestCase
  setup do
    @sequence_attachment = sequence_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sequence_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sequence_attachment" do
    assert_difference('SequenceAttachment.count') do
      post :create, sequence_attachment: { comment: @sequence_attachment.comment, sequence_id: @sequence_attachment.sequence_id, type: @sequence_attachment.type }
    end

    assert_redirected_to sequence_attachment_path(assigns(:sequence_attachment))
  end

  test "should show sequence_attachment" do
    get :show, id: @sequence_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sequence_attachment
    assert_response :success
  end

  test "should update sequence_attachment" do
    patch :update, id: @sequence_attachment, sequence_attachment: { comment: @sequence_attachment.comment, sequence_id: @sequence_attachment.sequence_id, type: @sequence_attachment.type }
    assert_redirected_to sequence_attachment_path(assigns(:sequence_attachment))
  end

  test "should destroy sequence_attachment" do
    assert_difference('SequenceAttachment.count', -1) do
      delete :destroy, id: @sequence_attachment
    end

    assert_redirected_to sequence_attachments_path
  end
end
