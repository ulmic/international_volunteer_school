class User < ActiveRecord::Base
  has_secure_password validations: false
  extend Enumerize
end
