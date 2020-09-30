class User < ActiveRecord::Base
    has_secure_password
    has_many :jazz_standards
end