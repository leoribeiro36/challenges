class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String
  field :password, type: String
  

  def authenticate(password)
    Base64.decode64(self.password) == password
  end
end
