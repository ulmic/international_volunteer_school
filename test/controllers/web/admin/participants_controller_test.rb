require 'test_helper'

class Web::Admin::ParticipantsControllerTest < ActionController::TestCase
  setup do
    admin = create :admin
    sign_in admin
    @participant = create :participant
  end

  test 'should get index' do
    get :index
    assert_response :success, @response.body
  end

  test 'should get new' do
    get :new
    assert_response :success, @response.body
  end

  test 'should create participant' do
    attributes = attributes_for :participant
    post :create, participant: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_participants_path
    participant = Participant.last
    participant.attribute_names.each do |name|
      unless immutable_attributes.include? name
        assert_equal attributes[name.to_sym], participant.send(name), name
      end
    end
  end

  test 'should not create participant' do
    attributes = { first_name: @participant.first_name }
    post :create, participant: attributes
    assert_response :success
  end

  test 'should get edit by admin' do
    get :edit, id: @participant
    assert_response :success
  end

  test 'should update category by admin' do
    attributes = attributes_for :participant
    put :update, id: @participant, participant: attributes
    assert_response :redirect
    @participant.reload
    @participant.attribute_names.each do |name|
      unless immutable_attributes.include? name
        assert_equal attributes[name.to_sym], @participant.send(name), name
      end
    end
  end

  test 'should not update adticle by admin' do
    attributes = attributes_for :participant
    attributes[:first_name] = nil
    count_before_save = Participant.count
    put :update, id: @participant, participant: attributes
    assert_equal Participant.count, count_before_save
    assert_response :success
  end

  test 'should destroy category' do
    count =  Participant.count
    delete :destroy, id: @participant
    assert count - 1, Participant.count
  end
end
