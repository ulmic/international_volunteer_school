class UserForm < ApplicationForm
  self.main_model = :user

  attributes :email, :password
end
