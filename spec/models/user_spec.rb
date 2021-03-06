require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
      
    end
    # 1. nicknameとemail、passwordとpassword_confirmation,first_name,:last_name,:last_name_kana,:first_name_kana,:birthdayが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation,first_name,:last_name,:last_name_kana,:first_name_kana,:birthday" do
      expect(@user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      @user.email = ""
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      @user.password = ""
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      @user. password_confirmation= ""
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 6. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user , email:"test@test")
      another_user = build(:user, email:"test@test")
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 7. passwordが6文字以上であれば登録できること
    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(@user).to be_valid
    end

    # 8. passwordが5文字以下であれば登録できないこと
    it "is invalid with a password that has less than 5 characters " do
      @user = build(:user, password: "00000", password_confirmation: "00000")
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end