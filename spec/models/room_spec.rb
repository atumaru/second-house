require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  describe '新規room登録' do
    context '新規room登録できるとき' do
      it 'room名が入力されていれば登録できる' do
        expect(@room).to be_valid
      end
    end

    context '新規room登録できないとき' do
      it 'room名が入力されていないと登録できない' do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include 'Nameを入力してください'
      end
    end
  end
end
