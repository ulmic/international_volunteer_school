require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase
  setup do
    create :page
  end

  test 'should get index' do
    get :index
    assert_response :success, @response.body
  end
end
