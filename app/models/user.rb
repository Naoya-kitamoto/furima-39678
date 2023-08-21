class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname,         presence: true
    validates :last_name,        presence: true
    validates :first_name,       presence: true
    validates :last_name_kana,   presence: true,
    format: { with: /\A[\p{katakana}ー－]+\z/ }
    validates :first_name_kana,  presence: true,
    format: { with: /\A[\p{katakana}ー－]+\z/ }
    validates :birth_day,        presence: true 
    validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "must include at least one letter and one number" }
    
    has_many :items
    has_many :purchases
end
