
    require 'rails_helper'
    RSpec.describe User, type: :model do
      before do
        @user = FactoryBot.build(:user)
      end
      describe 'ユーザー新規登録' do
        context '新規登録できるとき' do
          it '全て正常の時' do
            expect(@user).to be_valid
          end
        end
      
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
          it 'family_nameが空では登録できない' do
            @user.family_name = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "Family name can't be blank"
          end
          it 'first_nameが空では登録できない' do
            @user.first_name = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "First name can't be blank"
          end
          it 'family_name_kanaが空では登録できない' do
            @user.family_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "Family name kana can't be blank"
          end
          it 'first_name_kanaが空では登録できない' do
            @user.first_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "First name kana can't be blank"
          end
          it 'passwordが空では登録できない' do
            @user.password = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "Password can't be blank"
          end
          it 'birth_dayが空では登録できない' do
            @user.birth_day = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "Birth day can't be blank"
          end
          it " passwordは全角では登録できないこと " do
            @user.password = "テスト"
            @user.valid?
            expect(@user.errors.full_messages).to include("Password is invalid")
          end
          it " passwordは英語のみでは登録できないこと" do
            @user.password=  "テスト"
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)", "Password is invalid")
          end
          it " emailは＠を含むこと " do
            @user.email =  "test"
            @user.valid?
            expect(@user.errors.full_messages).to include("Email is invalid")
          end
          it " emailは一意性であること " do
            @user.save
            another_user = FactoryBot.build(:user)
            another_user.email = @user.email
            another_user.valid?
            expect(another_user.errors.full_messages).to include('Email has already been taken')
          end
          it " family_nameは漢字・平仮名・カタカナ以外では登録できないこと " do
            @user.family_name =  "test"
            @user.valid?
            expect(@user.errors.full_messages).to include("Family name is invalid")
          end
          it " first_nameは漢字・平仮名・カタカナ以外では登録できないこと " do
            @user.first_name =  "test"
            @user.valid?
            expect(@user.errors.full_messages).to include("First name is invalid")
          end
          it " first_name_kanaは全角カタカナ以外では登録できないこと " do
            @user.first_name_kana = "test"
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana is invalid")
          end
          it " family_name_kanaは全角カタカナ以外では登録できないこと " do
            @user.family_name_kana = 'test'
            @user.valid?
            expect(@user.errors.full_messages).to include("Family name kana is invalid")
          end
          it " passwordは数字のみでは登録できないこと" do
            @user.password= "00000"
            @user.valid?
            expect(@user.errors.full_messages).to include("Password is invalid")
          end
          it " passwordが5文字以下であれば登録できないこと " do
            @user.password=  "00000"
            @user.valid?
            expect(@user.errors.full_messages).to include("Password is invalid")
          end
      end
    end


   

    