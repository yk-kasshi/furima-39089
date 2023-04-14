require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it 'すべての情報が存在すれば登録できる' do
      expect(@user).to be_valid
    end
   end
   context '新規登録できないとき' do
    it 'nick_nameが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが一意性でなければ登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'encrypted_passwordが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'encrypted_passwordは、6文字以上での入力が必須であること' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'encrypted_passwordは、半角英数字混合での入力が必須であること' do
      @user.password ='test1'
      @user.password_confirmation = 'test1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'encrypted_passwordとpassword_confirmationは、値の一致が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名前（全角）は、名字が必須であること' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it '名前（全角）は、名前が必須であること' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it '名字（全角）は、漢字（全角）での入力が必須であること' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it '名字（全角）は、ひらがな（全角）での入力が必須であること' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it '名字（全角）は、カタカナ（全角）での入力が必須であること' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it '名前（全角）は、漢字（全角）での入力が必須であること' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it '名前（全角）は、ひらがな（全角）での入力が必須であること' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it '名前（全角）は、カタカナ（全角）での入力が必須であること' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it '名前カナ（全角）は、名字が必須であること' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it '名前カナ（全角）は、名前が必須であること' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it '名前カナ（全角）は、全角（カタカナ）での入力が必須であること' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it '生年月日が必須であること' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
   end
  end
end