require 'test_helper'

class Web::PagesControllerTest < ActionController::TestCase
  setup do
    @page = create :page
    create :page, :docs
  end
  test 'should get index' do
    get :show, id: @page
    assert_response :success, @response.body
  end
end
