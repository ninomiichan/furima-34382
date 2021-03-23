class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  with_options presence: true do
    validates :nickname
    validates :family_namelength: {with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,}
    validates :first_namelength: {with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,}
    validates :family_name_kana,length: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
    validates :first_name_kana,length: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
    validates :birth_day
  end

  validates :password,length: { /\A[a-z0-9]+\z/i
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
    
  
end


  # validates :nickname, with_optionsformat: {
  #   with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
  #   message: "は、全角で入力して下さい"
  #   }
  # validates :family_name, with_optionsformat: {
  #   with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
  #   message: "は、全角で入力して下さい"
  #   }
  # validates :first_name, with_optionsformat: {
  #   with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
  #   message: "は、全角で入力して下さい"
  #   }
  # validates :family_name_kana, with_options {
  #   with: /\A[\p{katakana}\p{blank}ー－]+\z/,
  #   message: 'は全角カナで入力して下さい。'
  # validates :first_name_kana, with_options {
  #   with: /\A[\p{katakana}\p{blank}ー－]+\z/,
  #   message: 'は全角カナで入力して下さい。'
