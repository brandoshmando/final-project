require 'rails_helper'

describe User, :type => :model do
  before do
    @user = User.new(first_name: "Brandon", last_name: "Shmando", email: "shmando@example.com", password: "Password")
  end

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

  let(:assistant) { FactoryGirl.create(:assistant) }
  let(:professor) { FactoryGirl.create(:professor) }
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

  describe "When first name is not present" do
    before { assistant.first_name = " " }

    it "is not valid" do
      expect(assistant).not_to be_valid
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
