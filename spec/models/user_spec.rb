require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemailとpasswordとbirthdayが存在し、passwordとpassword_confirmationが一致すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致し、6文字以上の半角英数字混合であれば登録できる' do
        @user.password = 'b00000'
        @user.password_confirmation = 'b00000'
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名字と名前、ユーザー本名の名字と名前のフリガナが存在すれば登録できる' do
        @user.family_name = '手簀戸'
        @user.first_name = '太郎'
        @user.family_name_kana = 'テスト'
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名が全角なら登録できる' do
        @user.family_name = '手簀戸'
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナが全角カタカナなら登録できる' do
        @user.family_name_kana = 'テスト'
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードと確認用パスワードが一致しないと登録できない' do
        @user.password_confirmation = 'b00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'ユーザー本名の名字が空では登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'ユーザー本名の名前が空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'ユーザー本名の名字のフリガナが空では登録できない' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ（名字）を入力してください")
      end
      it 'ユーザー本名の名前のフリガナが空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ（名前）を入力してください")
      end
      it '@を含まないメールアドレスは登録できない' do
        @user.email = 'kkk.gmai.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it '登録済みのメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it '6文字未満のパスワードは登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it '半角英数字混合ではないパスワードは登録できない（数字のみの検証）' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it '半角英数字混合ではないパスワードは登録できない（英字のみの検証）' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'ユーザー本名の名字は全角でないと登録できない' do
        @user.family_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は不正な値です')
      end
      it 'ユーザー本名の名前は全角でないと登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it 'ユーザー本名の名字のフリガナは全角のカタカナでないと登録できない' do
        @user.family_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('フリガナ（名字）は不正な値です')
      end
      it 'ユーザー本名の名前のフリガナは全角のカタカナでないと登録できない' do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('フリガナ（名前）は不正な値です')
      end
    end
  end
end
