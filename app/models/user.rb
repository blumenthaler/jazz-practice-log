class User < ActiveRecord::Base
    has_secure_password
    has_many :jazz_standards
    validates :username, :email, :instrument, presence: true
    validates :username, :email, uniqueness: true
end