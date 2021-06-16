require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'ルームチャット機能' do
    it 'contentとuser_idとroom_idが存在すれば保存できる' do
      expect(@message).to be_valid
    end
    it 'contentは空では保存できない' do
      @message.content = ''
      @message.valid?
      expect(@message.errors.full_messages).to include("Content can't be blank")
    end
    it 'userが紐付いていないと保存できないこと' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("User must exist")
    end
    it 'roomが紐付いていないと保存できないこと' do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Room must exist")
    end
  end
end
