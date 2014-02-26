require 'spec_helper'

describe Pledge do
  let(:pledge) {Pledge.create(amount: 56)}
  let(:user) {FactoryGirl.create(:user)}
  let(:project) {FactoryGirl.create(:project)}
  let(:reward) {FactoryGirl.create(:reward)}

  it "should be able to make a pledge" do
  	pledge.user = user
  	pledge.should be_valid
  end
end
