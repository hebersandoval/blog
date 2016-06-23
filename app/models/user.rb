class User < ActiveRecord::Base
  has_many :posts
  has_secure_password # this is a macro that gives us some methods like .authenticate to use in our controller action
  validates_presence_of :username, :email, :password # validating attributes to make sure no one can sign up without inputting  their name, email and password


end
