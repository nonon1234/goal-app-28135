require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe '目標新規作成' do
    before do
      @goal = FactoryBot.build(:goal)
    end

    context '目標の新規登録がうまくいくとき' do
      it '全ての項目が正しく入力されていれば登録できること' do
        expect(@goal).to be_valid
      end
    end

    context '目標の新規登録がうまくいかないとき' do
      it 'titleが空だと登録できない' do
        @goal.title = nil
        @goal.valid?
        expect(@goal.errors.full_messages).to include('Titleを入力してください')
      end

      it 'descriptionが空だと登録できない' do
        @goal.description = nil
        @goal.valid?
        expect(@goal.errors.full_messages).to include('Descriptionを入力してください')
      end

      it 'deadlineが空だと登録できない' do
        @goal.deadline = nil
        @goal.valid?
        expect(@goal.errors.full_messages).to include('Deadlineを入力してください')
      end

      it 'userが紐づいていないと登録できない' do
        @goal.user = nil
        @goal.valid?
        expect(@goal.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
