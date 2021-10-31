require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe 'create' do
    context 'userを登録できる場合' do
      let(:user) { build(:user) }
      it '全ての入力が正常の場合、登録できること' do
        expect(user).to be_valid
      end

      it '名前が50文字以内だと保存できること' do
        user.username = 'a' * 50
        expect(user).to be_valid
      end

      it 'メールアドレスが255文字以内だと保存できること' do
        user.email = "aaaaa@#{'a' * 245}.com"
        expect(user).to be_valid
      end

      it '有効なメールフォーマットだと保存できること' do
        valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                             first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end

      it 'パスワードが6文字以上だと保存できること' do
        user.password = 'aaaaaa'
        user.password_confirmation = 'aaaaaa'
        expect(user).to be_valid
      end
    end

    context 'userを登録できない場合' do
      let(:user) { build(:user) }

      it '名前がなければ保存できないこと' do
        user.username = ''
        expect(user).to be_invalid
      end

      it '名前が51文字以上だと保存できないこと' do
        user.username = 'a' * 51
        expect(user).to be_invalid
      end

      it 'メールアドレスが空欄だと保存できないこと' do
        user.email = ''
        expect(user).to be_invalid
      end

      it 'メールアドレスが256文字以上だと保存できないこと' do
        user.email = "aaaaa@#{'a' * 246}.com"
        expect(user).to be_invalid
      end

      it '重複したメールアドレスがあれば保存できないこと' do
        duplicate_user = user.dup
        user.save
        expect(duplicate_user).to be_invalid
      end

      it '無効なメールフォーマットだと保存できないこと' do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                               foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).to be_invalid
        end
      end

      it 'パスワードが空欄だと保存できないこと' do
        user.password = ''
        user.password_confirmation = ''
        expect(user).to be_invalid
      end

      it 'パスワード確認が空欄だと保存できないこと' do
        user.password_confirmation = ''
        expect(user).to be_invalid
      end

      it 'パスワードが6文字以下だと保存できないこと' do
        user.password = 'a' * 5
        expect(user).to be_invalid
      end

      it 'パスワードとパスワード確認が違うと保存できないこと' do
        user.password_confirmation = 'a' * 6
        expect(user).to be_invalid
      end
    end
  end

  describe '削除依存性の検証' do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    it '削除すると紐づく投稿も削除されること' do
      create(:affirmation, user: user)
      expect { user.destroy }.to change(user.affirmations, :count).by(-1)
    end

#    it '削除すると紐づくコメントも削除されること' do
#      create(:comment, user: user)
#      expect { user.destroy }.to change(user.comments, :count).by(-1)
#    end

  end

end
