class User < ApplicationRecord
    has_secure_password
    has_many :content, dependent: :destroy
    validates :email,
              :presence => { message: 'Email cannot be empty' },
              :format => { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: 'Incorrect email address format' },
              :uniqueness => { message: 'Email must be unique' }
    validates :password, format: { with: /\A.*(?=.*\d)(?=.*[!@#$%^&*]).*\z/, message: 'must contain at least one digit and one special character' }
end
