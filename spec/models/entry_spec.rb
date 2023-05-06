require "rails_helper"

RSpec.describe Entry, type: :model do
  before do
    @user = create(:user)
    @entry = create(:entry, user_id: @user.id, question: "test", answer: "testanswer")
  end
  
  it "has an assigned user" do
    expect(@entry.user.name).to eq("User name")
  end
  
  it "has a question" do
    expect(@entry.question).to_not eq("")
  end
end