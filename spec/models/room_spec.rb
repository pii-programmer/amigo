require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム作成機能' do
    it 'titleが存在すれば作成できる' do
      expect(@room).to be_valid
    end
    it 'titleが空では作成できない' do
      @room.title = ''
      @room.valid?
      expect(@room.errors.full_messages).to include("Title can't be blank")
    end
  end
end