require 'test_helper'

module UserRemarks
  class MessagesControllerTest < ActionController::TestCase
    setup do
      @message = messages(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:remarks)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create message" do
      assert_difference('Message.count') do
        post :create, message: { link: @message.link, text: @message.text, title: @message.title, user_id: @message.user_id, user_type: @message.user_type }
      end

      assert_redirected_to message_path(assigns(:message))
    end

    test "should show message" do
      get :show, id: @message
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @message
      assert_response :success
    end

    test "should update message" do
      patch :update, id: @message, message: { link: @message.link, text: @message.text, title: @message.title, user_id: @message.user_id, user_type: @message.user_type }
      assert_redirected_to message_path(assigns(:message))
    end

    test "should destroy message" do
      assert_difference('Message.count', -1) do
        delete :destroy, id: @message
      end

      assert_redirected_to messages_path
    end
  end
end
