require 'bcrypt'
class User < ApplicationRecord
    validates :email, :password_digest, :session_token, presence: true
    validates :email, uniqueness: true 
    validates :password, length: {minimum: 6} allow_nil: true
    validate :is_it_an_email?
    after_initialize :ensure_session_token

    attr_reader :password

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.session_token).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = self.find_by(email: email)
        return nil unless user
        user.is_password?(password)? user: nil
    end

    def reset_session_token!
        self.session_token = RandomSecure.base64(16)
        self.save
        self.session_token
    end

    private 

    def ensure_session_token
        self.session_token||= RandomSecure.base64(16)
    end

    def is_it_an_email?
        unless self.email.include('@')&& self.email.include('.com')
            user[:errors]<< 'user email is needs @ and .com'
        end
    end
end
