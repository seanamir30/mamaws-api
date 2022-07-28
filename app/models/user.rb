class User < ApplicationRecord
  has_many :api_v1_carts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

    def self.generate_jwt(id)
      JWT.encode({ id: id,
                  exp: 60.days.from_now.to_i },
                  Rails.application.secrets.secret_key_base)
    end

end
