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
    end
    it 'emailが一意性でなければ登録できない' do
    end
    it 'emailは@を含まないと登録できない' do
    end
    it 'encrypted_passwordが必須であること' do
    end
    it 'encrypted_passwordは、6文字以上での入力が必須であること' do
    end
    it 'encrypted_passwordは、半角英数字混合での入力が必須であること' do
    end
    it 'encrypted_passwordとpassword_confirmationは、値の一致が必須であること' do
    end
    it '名前（全角）は、名字が必須であること' do
    end
    it '名前（全角）は、名前が必須であること' do
    end
    it '名字（全角）は、漢字（全角）での入力が必須であること' do
    end
    it '名字（全角）は、ひらがな（全角）での入力が必須であること' do
    end
    it '名字（全角）は、カタカナ（全角）での入力が必須であること' do
    end
    it '名前（全角）は、漢字（全角）での入力が必須であること' do
    end
    it '名前（全角）は、ひらがな（全角）での入力が必須であること' do
    end
    it '名前（全角）は、カタカナ（全角）での入力が必須であること' do
    end
    it '名前カナ（全角）は、名字が必須であること' do
    end
    it '名前カナ（全角）は、名前が必須であること' do
    end
    it '名前カナ（全角）は、全角（カタカナ）での入力が必須であること' do
    end
    it '生年月日が必須であること' do
    end
   end
  end
end