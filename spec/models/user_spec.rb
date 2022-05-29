require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'name属性の存在性を検証' do
    context 'name属性が存在する場合' do
      it 'name属性が有効であること' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'name属性が空文字の場合' do
      it 'name属性が無効であること' do
        user = build(:user, name: '')
        expect(user).to be_invalid
        expect(user.errors.full_messages).to include('ユーザー名を入力してください')
        expect(user.errors.full_messages).to include('ユーザー名は6文字以上で入力してください')
      end
    end

    context 'name属性が空白文字の場合' do
      it 'name属性が無効であること' do
        user = build(:user, name: ' ')
        expect(user).to be_invalid
        expect(user.errors.full_messages).to include('ユーザー名を入力してください')
        expect(user.errors.full_messages).to include('ユーザー名は6文字以上で入力してください')
      end
    end

    context 'name属性がnilの場合' do
      it 'name属性が無効であること' do
        user = build(:user, name: nil)
        expect(user).to be_invalid
        expect(user.errors.full_messages).to include('ユーザー名を入力してください')
        expect(user.errors.full_messages).to include('ユーザー名は6文字以上で入力してください')
      end
    end
  end

  describe 'email属性の存在性を検証' do
    context 'email属性が存在する場合' do
      it 'email属性が有効であること' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'email属性が空文字の場合' do
      it 'email属性が無効であること' do
        user = build(:user, email: '')
        expect(user).to be_invalid
        expect(user.errors.full_messages).to include('メールアドレスを入力してください')
      end
    end

    context 'email属性が空白文字の場合' do
      it 'email属性が無効であること' do
        user = build(:user, email: ' ')
        expect(user).to be_invalid
        expect(user.errors.full_messages).to include('メールアドレスを入力してください')
      end
    end

    context 'email属性がnilの場合' do
      it 'email属性が無効であること' do
        user = build(:user, email: nil)
        expect(user).to be_invalid
        expect(user.errors.full_messages).to include('メールアドレスを入力してください')
      end
    end
  end

  describe 'name属性の長さを検証' do
    context 'name属性が6文字以上20文字以下の場合' do
      it 'name属性が有効であること' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'name属性が5文字以下の場合' do
      it 'name属性が無効であること' do
        invalid_name = Faker::Alphanumeric.alpha(number: 5)
        user = build(:user, name: invalid_name)
        expect(user).to be_invalid
        expect(user.errors.full_messages).to include('ユーザー名は6文字以上で入力してください')
      end
    end

    context 'name属性が21文字以上の場合' do
      it 'name属性が無効であること' do
        invalid_name = Faker::Alphanumeric.alpha(number: 21)
        user = build(:user, name: invalid_name)
        expect(user).to be_invalid
        expect(user.errors.full_messages).to include('ユーザー名は20文字以内で入力してください')
      end
    end
  end

  describe 'email属性の長さを検証' do
    context 'email属性が255文字以下の場合' do
      it 'email属性が有効であること' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'email属性が256文字以上の場合' do
      it 'email属性が無効であること' do
        invalid_email = "#{Faker::Alphanumeric.alpha(number: 244)}@example.com"
        user = build(:user, email: invalid_email)
        expect(user).to be_invalid
        expect(user.errors.full_messages).to include('メールアドレスは255文字以内で入力してください')
      end
    end
  end
end
