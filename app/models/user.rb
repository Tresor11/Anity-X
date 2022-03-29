class User < ApplicationRecord
  include Clearance::User

  validates_presence_of :email
  has_many :articles
end
