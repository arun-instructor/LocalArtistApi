class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_auth_token

  private

		def set_auth_token
			if auth_token.present? 
				return
			else
				self.auth_token = generate_auth_token
			end
		end

		def generate_auth_token
			return SecureRandom.uuid.gsub(/\-/, '')
		end
end
