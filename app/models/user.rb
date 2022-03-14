class User < ApplicationRecord
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before_save :downcase_email
    before_create :create_activation_digest
    has_many :micropost
    validates :name, presence: true, length: {maximum: 50} 
    validates :email, presence: true, length: {maximum: 255}, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false } 
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    private

        # Converts email to all lower-case.
        def downcase_email
            self.email = email.downcase
        end
        
        # Creates and assigns the activation token and digest.
        def create_activation_digest
            self.activation_token = User.new_token self.activation_digest = User.digest(activation_token)
        end

end
