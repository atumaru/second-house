require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'tweet投稿' do
    context 'tweet投稿ができるとき' do
      it 'title,text,imageが入力されていれば投稿できる' do
        expect(@tweet).to be_valid
      end
    end

    context 'tweet投稿できないとき' do
      it 'titleが空だと投稿できない' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include 'Titleを入力してください'
      end

      it 'textが空だと投稿できない' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include 'Textを入力してください'
      end

      it 'imageが空だと投稿できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include 'Imageを入力してください'
      end

      it 'userが紐付いてなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include 'Userを入力してください'
      end

      it 'prefecture_idが空だと投稿できない' do
        @tweet.prefecture_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include 'Prefectureを入力してください'
      end
    end
  end
end
