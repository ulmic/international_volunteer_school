class PageForm < ApplicationForm
  self.main_model = :page

  attributes :title, :body, :slug, require: true
end
