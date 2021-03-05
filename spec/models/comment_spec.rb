require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
   end

   describe "コメント投稿" do
   
    context "コメント投稿できるとき" do
    
      it "textが入力されていれば投稿できる" do
        expect(@comment).to be_valid
      end
    

    end
     
    context "コメント投稿できないとき" do
      it "textが空だと投稿できない" do
      @comment.text = nil
      @comment.valid?
    expect(@comment.errors.full_messages).to include "Textを入力してください"
    end
     
     it "userが紐付いてないと投稿できない" do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include "Userを入力してください"
     end

     it "tweetが紐付いてないと投稿できない" do
      @comment.tweet = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include "Tweetを入力してください"
     end
       
     end


  end
  
end
