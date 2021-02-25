require 'rails_helper'

RSpec.describe Event, type: :model do
 before do
  @event = FactoryBot.build(:event)
 end

describe "event登録" do
 
  context "event登録できるとき" do
  
    it "title,content,start_timeが入力されていれば登録できる" do
      expect(@event).to be_valid
    end
  
  end

  context "event登録できないとき" do
  
    it "titleが空だと登録できない" do
      @event.title = ""
      @event.valid?
      expect(@event.errors.full_messages).to include "Titleを入力してください"
    end

    it "contentが空だと登録できない" do
      @event.content = ""
      @event.valid?
      expect(@event.errors.full_messages).to include "Contentを入力してください"
    end

    it "start_timeが空だと登録できない" do
      @event.start_time = ""
      @event.valid?
      expect(@event.errors.full_messages).to include "Start timeを入力してください"
    end

    it "prefecture_idが空だと登録できない" do
      @event.prefecture_id = ""
      @event.valid?
      expect(@event.errors.full_messages).to include "Prefectureを入力してください"
    end

    it "userが紐付いていないと登録できない" do
      @event.user = nil
      @event.valid?
      expect(@event.errors.full_messages).to include "Userを入力してください"
    end
  end


end



end
