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
      expect(@user.errors.full_messages).to include "Nicknameを入力してください" 
      end

      it "emailが空だと登録ができない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Emailを入力してください" 
    end

    it "emailは重複して登録ができない" do
      @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Emailはすでに存在します"
    end
        it "passwordが空だと登録ができない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Passwordを入力してください", "Passwordは6文字以上で入力してください", "Passwordは不正な値です", "Password confirmationとPasswordの入力が一致しません"
    end

    it "passwordが入力されていてもpassword_confirmationが空だと登録ができない" do
    @user.password = "999999a"  
    @user.password_confirmation = ""
    @user.valid?
    expect(@user.errors.full_messages).to include "Password confirmationとPasswordの入力が一致しません"
    end

    it "passwordが5文字以下だと登録ができない" do
    @user.password = "99999"
    @user.password_confirmation = "99999"
    @user.valid?
    expect(@user.errors.full_messages).to include "Passwordは6文字以上で入力してください", "Passwordは不正な値です"
    end

    it "passwordが英数字混合でないと登録ができない" do
      @user.password = "999999"
      @user.password_confirmation = "999999"
      @user.valid?
      expect(@user.errors.full_messages).to include "Passwordは不正な値です"
    end

    it "passwordが全角英数字だと登録ができない" do
      @user.password = "９９９９９ａ"
      @user.password_confirmation = "９９９９９ａ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Passwordは不正な値です"
    end


    it "last_nameが空だと登録ができない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Last nameを入力してください", "Last nameは不正な値です"
    end

    it "last_nameが全角英数字だと登録ができない" do
      @user.last_name = "９９９９９ａ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last nameは不正な値です"
    end

    it "first_nameが空だと登録ができない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "First nameを入力してください", "First nameは不正な値です"
    end

    it "first_nameが全角英数字だと登録ができない" do
      @user.first_name = "９９９９９ａ"
      @user.valid?
      expect(@user.errors.full_messages).to include "First nameは不正な値です"
    end
    
    it "prefecture_idが空だと登録ができない" do
      @user.prefecture_id = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Prefectureを入力してください", "Prefectureは数値で入力してください"
    end

    it "prefecture_idが1だと登録ができない" do
      @user.prefecture_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include "Prefectureは1以外の値にしてください"
    end

    it "prefecture_now_idが空だと登録ができない" do
      @user.prefecture_now_id = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Prefecture nowを入力してください", "Prefecture nowは数値で入力してください"
    end

    it "prefecture_now_idが1だと登録ができない" do
      @user.prefecture_now_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include "Prefecture nowは1以外の値にしてください"
    end
  end



  end
end
