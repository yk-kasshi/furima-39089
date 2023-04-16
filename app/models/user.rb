class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ーA-Za-z0-9]+\z/ }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい'  }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい'  }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true

  validate :validate_password_confirmation

  private

  def validate_password_confirmation
    if password_confirmation.present? && password != password_confirmation
      errors.add(:password_confirmation, "doesn't match Password")
    end
  end
end
