require 'spec_helper'

describe Project do
  let(:owner) {FactoryGirl.create(:user)}
  let(:project) {FactoryGirl.create(:project)}

  it "should allow a user to create a project" do
  	project.owner = owner
  	project.should be_valid
  end 
end
