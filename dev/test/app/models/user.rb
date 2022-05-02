class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String
  field :password_digest, type: String
  field :—no-test-framework, type: String
end
