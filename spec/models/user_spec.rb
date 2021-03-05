require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "nicknameとemailとpasswordとpassword_confirmationとfirst_nameとlast_nameが入力されておりprefecture_idとprefecture_now_idが2~48であれば登録できる" do
      expect(@user).to be_valid
     end
   end

   context '新規登録ができないとき' do
    it "nicknameが空だと登録ができない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "ニックネームを入力してください" 
      end

      it "emailが空だと登録ができない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "メールアドレスを入力してください" 
    end

    it "emailは重複して登録ができない" do
      @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "メールアドレスはすでに存在します"
    end
        it "passwordが空だと登録ができない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください", "パスワードは6文字以上で入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません"
    end

    it "passwordが入力されていてもpassword_confirmationが空だと登録ができない" do
    @user.password = "999999a"  
    @user.password_confirmation = ""
    @user.valid?
    expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
    end

    it "passwordが5文字以下だと登録ができない" do
    @user.password = "99999"
    @user.password_confirmation = "99999"
    @user.valid?
    expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください", "パスワードは不正な値です"
    end

    it "passwordが英数字混合でないと登録ができない" do
      @user.password = "999999"
      @user.password_confirmation = "999999"
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードは不正な値です"
    end

    it "passwordが全角英数字だと登録ができない" do
      @user.password = "９９９９９ａ"
      @user.password_confirmation = "９９９９９ａ"
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードは不正な値です"
    end


    it "last_nameが空だと登録ができない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "お名前(姓)を入力してください", "お名前(姓)は不正な値です"
    end

    it "last_nameが全角英数字だと登録ができない" do
      @user.last_name = "９９９９９ａ"
      @user.valid?
      expect(@user.errors.full_messages).to include "お名前(姓)は不正な値です"
    end

    it "first_nameが空だと登録ができない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "お名前(名)を入力してください", "お名前(名)は不正な値です"
    end

    it "first_nameが全角英数字だと登録ができない" do
      @user.first_name = "９９９９９ａ"
      @user.valid?
      expect(@user.errors.full_messages).to include "お名前(名)は不正な値です"
    end
    
  
    it "prefecture_idが1だと登録ができない" do
      @user.prefecture_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include "出身地を選択してください"
    end

   

    it "prefecture_now_idが1だと登録ができない" do
      @user.prefecture_now_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include "現在のお住まいを選択してください"
    end

    it "prefecture_idとprefecture_now_idが一緒だと登録できない" do
    @user.prefecture_id = 4
    @user.prefecture_now_id = 4
    @user.valid?
    expect(@user.errors.full_messages).to include "出身地と現在のお住まいは違う県を選んでください ※"
    end
  end



  end
end
