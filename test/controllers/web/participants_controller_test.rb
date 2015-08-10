require 'test_helper'

class Web::ParticipantsControllerTest < ActionController::TestCase
  setup do
    @attrs = attributes_for :participant
    @participant = create :participant
    @participant.save
    create :page
    create :page, :docs
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get index' do
    get :index
    assert_response :success, @response.body
  end

  test 'should create' do
    attributes = attributes_for :participant
    post :create, participant: attributes
    assert_response :redirect
    participant = Participant.last
    participant.attribute_names.each do |name|
      unless immutable_attributes.include? name
        assert_equal attributes[name.to_sym], participant.send(name), name
      end
    end
  end

  test 'should not create' do
    attrs = attributes_for :participant
    attrs[:first_name] = nil
    count = Participant.count
    post :create, participant: attrs
    assert_response :success
    assert_equal count, Participant.count
  end
end
