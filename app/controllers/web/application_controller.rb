class Web::ApplicationController < ApplicationController
  include Concerns::AuthManagment

  before_filter :load_about_page

  def load_about_page
    @about_page = Page.find_by_slug :about
  end
end
