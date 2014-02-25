require 'spec_helper'

describe User do
  before {@user = User.new(email: "sup@gmail.com", first_name: "Billy", last_name: "Bob", password: "billybob", password_confirmation: "billybob")}

  subject {@user}

  describe "things should not be blank" do
  	before {@user.email = " "}
  	it {should_not be_valid}
  end

  describe "password has to be at least 6 characters" do
  	before {@user.password = "agne"}
  	it {should_not be_valid}
  end
end
