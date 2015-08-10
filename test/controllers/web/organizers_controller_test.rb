require 'test_helper'

class Web::OrganizersControllerTest < ActionController::TestCase
  setup do
    @attrs = attributes_for :organizer
    @organizer = create :organizer
    @organizer.save
    create :page
    create :page, :docs
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create' do
    attributes = attributes_for :organizer
    post :create, organizer: attributes
    assert_response :redirect
    organizer = Organizer.last
    organizer.attribute_names.each do |name|
      unless immutable_attributes.include? name
        assert_equal attributes[name.to_sym], organizer.send(name), name
      end
    end
  end

  test 'should not create' do
    attrs = attributes_for :organizer
    attrs[:first_name] = nil
    count = Organizer.count
    post :create, organizer: attrs
    assert_response :success
    assert_equal count, Organizer.count
  end
end
