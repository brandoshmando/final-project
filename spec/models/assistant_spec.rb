require 'rails_helper'

RSpec.describe Assistant, :type => :model do
  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:email)}
  it {should respond_to(:type)}
  it {should respond_to(:activation_state)}
end
