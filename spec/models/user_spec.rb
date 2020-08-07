require 'rails_helper'
describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードと確認用パスワードが一致しないと登録できない" do
      user = FactoryBot.build(:user)
      user.password_confirmation = "b00000"
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名の名字が空では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it "ユーザー本名の名前が空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名の名字のフリガナが空では登録できない" do
      user = FactoryBot.build(:user)
      user.family_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "ユーザー本名の名前のフリガナが空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "@を含まないメールアドレスは登録できない" do
      user = FactoryBot.build(:user)
      user.email = "kkk.gmai.com"
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "6文字未満のパスワードは登録できない" do
      user = FactoryBot.build(:user)
      user.password = "a0000"
      user.password_confirmation = "a0000"
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "半角英数字混合ではないパスワードは登録できない（数字のみの検証）" do
      user = FactoryBot.build(:user)
      user.password = "000000"
      user.password_confirmation = "000000"
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it "半角英数字混合ではないパスワードは登録できない（英字のみの検証）" do
      user = FactoryBot.build(:user)
      user.password = "aaaaaa"
      user.password_confirmation = "aaaaaa"
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it "ユーザー本名の名字は全角でないと登録できない" do
      user = FactoryBot.build(:user)
      user.family_name = "test"
      user.valid?
      expect(user.errors.full_messages).to include("Family name is invalid")
    end
    it "ユーザー本名の名前は全角でないと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = "taro"
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid")
    end
    it "ユーザー本名の名字のフリガナは全角のカタカナでないと登録できない" do
      user = FactoryBot.build(:user)
      user.family_name_kana = "ﾃｽﾄ"
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "ユーザー本名の名前のフリガナは全角のカタカナでないと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = "ﾀﾛｳ"
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid")
    end
  end
end