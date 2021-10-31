require 'rails_helper'

RSpec.describe Affirmation, type: :model do
  describe '#create' do
    let(:affirmation) { build(:affirmation) }

    context '投稿を保存できる場合' do
      it '正しく保存できること' do
        example_affirmation = FactoryBot.create(:affirmation)
        expect(example_affirmation).to be_valid
      end
    end

    context '投稿を保存できない場合' do
      it 'タイトルが空欄だと保存できないこと' do
        affirmation.title = ''
        expect(affirmation).to be_invalid
      end

      it 'タイトルが30文字以上だと保存できないこと' do
        affirmation.title = 'a' * 31
        expect(affirmation).to be_invalid
      end

      it '詳細が空欄だと保存できないこと' do
        affirmation.body = ''
        expect(affirmation).to be_invalid
      end

      it '詳細が200文字以上だと保存できないこと' do
        affirmation.body = 'a' * 200
        expect(affirmation).to be_invalid
      end

      it '画像が未入力だと保存できないこと' do
        affirmation.image = ''
        expect(affirmation).to be_invalid
      end
    end

  end
end
