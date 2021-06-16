require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @chat = FactoryBot.build(:chat)
  end

  describe 'メインチャット機能' do
    context 'メインチャットが保存できるとき' do
      it 'contentとuser_idが存在すれば保存できる' do
        expect(@chat).to be_valid
      end
    end
    context 'メインチャットが保存できないとき' do
      it 'contentは空だと保存できない' do
        @chat.content = ''
        @chat.valid?
        expect(@chat.errors.full_messages).to include("Content can't be blank")
      end
      it 'userが紐づいていないと保存できない' do
        @chat.user = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include("User must exist")
      end
    end
  end
end
