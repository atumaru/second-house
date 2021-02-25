require 'rails_helper'

RSpec.describe Message, type: :model do
  before do 
    @message = FactoryBot.build(:message)
  end

  describe "message投稿" do
 
 context "messageが投稿できるとき" do
  
  it "contentが入力されていれば投稿できる" do
    expect(@message).to be_valid
  end


end

 context "messageが投稿できないとき" do
 
  it "contentが入力されていなければ登録できない" do
    @message.content = ""
    @message.valid?
    expect(@message.errors.full_messages).to include "Contentを入力してください"
  end

  it "userが紐付いてなければ投稿できない" do
    @message.user = nil
    @message.valid?
    expect(@message.errors.full_messages).to include "Userを入力してください"
  end

  it "roomが紐付いてなければ投稿できない" do
    @message.room = nil
    @message.valid?
    expect(@message.errors.full_messages).to include "Roomを入力してください"
  end


 end


end

end
