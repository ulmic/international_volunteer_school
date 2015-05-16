require 'test_helper'

class Web::Admin::PagesControllerTest < ActionController::TestCase
  setup do
    admin = create :admin
    sign_in admin
    @page = create :page
  end

  test 'should get index' do
    get :index
    assert_response :success, @response.body
  end

  test 'should get new' do
    get :new
    assert_response :success, @response.body
  end

  test 'should create page' do
    attributes = attributes_for :page
    post :create, page: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_pages_path
    page = Page.last
    page.attribute_names.each do |name|
      unless immutable_attributes.include? name
        assert_equal attributes[name.to_sym], page.send(name), name
      end
    end
  end

  test 'should not create page' do
    attributes = { title: @page.title }
    post :create, page: attributes
    assert_response :success
  end

  test 'should get edit by admin' do
    get :edit, id: @page
    assert_response :success
  end

  test 'should update category by admin' do
    attributes = attributes_for :page
    put :update, id: @page, page: attributes
    assert_response :redirect
    @page.reload
    @page.attribute_names.each do |name|
      unless immutable_attributes.include? name
        assert_equal attributes[name.to_sym], @page.send(name), name
      end
    end
  end

  test 'should not update adticle by admin' do
    attributes = attributes_for :page
    attributes[:title] = nil
    count_before_save = Page.count
    put :update, id: @page, page: attributes
    assert_equal Page.count, count_before_save
    assert_response :success
  end

  test 'should destroy category' do
    count =  Page.count
    delete :destroy, id: @page
    assert count - 1, Page.count
  end
end
