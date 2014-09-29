require 'rails_helper'

describe User, :type => :model do
  before do
    @user = User.new(first_name: "Brandon", last_name: "Shmando", email: "shmando@example.com", password: "Password", password_confirmation: "Password")
  end

  let(:assistant) { FactoryGirl.create(:assistant) }
  let(:professor) { FactoryGirl.create(:professor) }

  subject { @user }

  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:email)}
  it {should respond_to(:type)}
  it {should respond_to(:crypted_password)}
  it {should respond_to(:salt)}
  it {should respond_to(:activation_state)}
  it {should respond_to(:activation_token)}
  it {should respond_to(:activation_token)}
  it {should respond_to(:activation_token_expires_at)}
  it {should respond_to(:reset_password_token)}
  it {should respond_to(:reset_password_token_expires_at)}
  it {should respond_to(:reset_password_email_sent_at)}
  it {should respond_to(:remember_me_token)}
  it {should respond_to(:remember_me_token_expires_at)}
  it {should respond_to(:avatar_file_name)}
  it {should respond_to(:avatar_content_type)}
  it {should respond_to(:avatar_file_size)}
  it {should respond_to(:avatar_updated_at)}

  describe "When first name is not present" do
    before { @user.first_name = " " }

    it "is not valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "When first name is too long" do
    before { @user.first_name = "a" * 26 }

    it "is not valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "When last name is not present" do
    before { @user.last_name = " " }

    it "is not valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "When last name is too long" do
    before { @user.last_name = "a" * 26 }

    it "is not valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "When email is not present" do
    before { @user.email = " " }

    it "is not valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "When email is not properly formatted" do
    before { @user.email = "myemailgmail" }

    it "is not valid" do
      expect(@user).not_to be_valid
    end
  end
  describe "Password is not present" do
    before { @user.password = " " }

    it "is not valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "Password confirmation is not present" do
    before { @user.password_confirmation = " " }

    it "is not valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "Password and password confirmation mismatch" do

    before do
      @user.confirmation = "Password"
      @user.password_confirmation = "Mismatched!"
    end

    it "is not valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "Password is too short" do
    before do
      @user.password = "a"
      @user.password_confirmation = "a"
    end

    it "is not valid" do
      expect(@user).not_to be_valid
    end
  end


  #Tests for User type assistant-----------------------
  describe "Assistant#new" do
    it "is valid" do
      expect(assistant).to be_valid
    end

    it "returns a new instance of Assistant" do
      expect(assistant).to be_a Assistant
    end

    it "has #type 'Assistant'" do
      expect(assistant.type).to eq("Assistant")
    end
  end

  #Tests for User type professor-----------------------
  describe "Professor#new" do
    it "is valid" do
      expect(professor).to be_valid
    end

    it "returns a new instance of Professor" do
      expect(professor).to be_a Professor
    end

    it "has #type 'Professor'" do
      expect(professor.type).to eq("Professor")
    end
  end
end
