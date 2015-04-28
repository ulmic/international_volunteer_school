require 'test_helper'

class Web::Admin::OrganizersControllerTest < ActionController::TestCase
  setup do
    admin = create :admin
    sign_in admin
    @organizer = create :organizer
  end

  test 'should get index' do
    get :index
    assert_response :success, @response.body
  end

  test 'should get new' do
    get :new
    assert_response :success, @response.body
  end

  test 'should create organizer' do
    attributes = attributes_for :organizer
    post :create, organizer: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_organizers_path
    organizer = Organizer.last
    organizer.attribute_names.each do |name|
      unless immutable_attributes.include? name
        assert_equal attributes[name.to_sym], organizer.send(name), name
      end
    end
  end

  test 'should not create organizer' do
    attributes = { first_name: @organizer.first_name }
    post :create, organizer: attributes
    assert_response :success
  end

  test 'should get edit by admin' do
    get :edit, id: @organizer
    assert_response :success
  end

  test 'should update category by admin' do
    attributes = attributes_for :organizer
    put :update, id: @organizer, organizer: attributes
    assert_response :redirect
    @organizer.reload
    @organizer.attribute_names.each do |name|
      unless immutable_attributes.include? name
        assert_equal attributes[name.to_sym], @organizer.send(name), name
      end
    end
  end

  test 'should not update adticle by admin' do
    attributes = attributes_for :organizer
    attributes[:first_name] = nil
    count_before_save = Organizer.count
    put :update, id: @organizer, organizer: attributes
    assert_equal Organizer.count, count_before_save
    assert_response :success
  end

  test 'should destroy category' do
    count =  Organizer.count
    delete :destroy, id: @organizer
    assert count - 1, Organizer.count
  end
end
