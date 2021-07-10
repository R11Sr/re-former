class User < ApplicationRecord
    validates :username, presence: true, length: {maximum: 15}
    validates :email, presence: true
    validates :password, presence: true
    
end
