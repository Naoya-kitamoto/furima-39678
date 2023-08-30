class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname,         presence: true
    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "cannot use half width character" } do
      validates :last_name,        presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "cannot use half width character" }
      validates :first_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "cannot use half width character" }
    end
    validates :last_name_kana,   presence: true,
    format: { with: /\A[\p{katakana}ー－]+\z/ }
    validates :first_name_kana,  presence: true,
    format: { with: /\A[\p{katakana}ー－]+\z/ }
    validates :birth_day,        presence: true 
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: "must include at least one letter and one number"
    has_many :purchases
    has_many :items
end
