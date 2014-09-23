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

  describe "Assitant#new" do
    before(:each) do
      @assistant = Assistant.new(first_name: "Brandon", last_name: "Shmando", email: "shmando@example.com", password: "Password")
    end
    it "should return a new instance of Assistant" do
      expect(@assistant).to be_a Assistant
    end

    it "should have #type 'Assistant'" do
      expect(@assistant.type).to eq("Assistant")
    end
  end

  describe "Professor#new" do
    before(:each) do
      @assistant = Professor.new(first_name: "Prof", last_name: "Shmando", email: "profshmando@example.com", password: "Password")
    end
    it "should return a new instance of Professor" do
      expect(@assistant).to be_a Professor
    end

    it "should have #type 'Assistant'" do
      expect(@assistant.type).to eq("Professor")
    end
  end


end
