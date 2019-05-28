class User < ApplicationRecord
  has_secure_password
  has_many :entries, :dependent => :destroy
  validates :username, :password_digest, presence: true
  validates_length_of :username, :minimum => 5
  validates_length_of :name, :minimum => 2
  validates_uniqueness_of :username, :case_sensitive => false
end
