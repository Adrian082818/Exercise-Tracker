class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

         def self.from_omniuath(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid 
            user.email = auth.info.email 
            user.password = Devise.friendly_token[0,20]
          end 
         end 

    has_many :exercises 
    has_many :coaches, through: :exercises
end
