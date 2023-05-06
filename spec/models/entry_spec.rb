require "rails_helper"

RSpec.describe Entry, type: :model do
  it "has an assigned user" do
    user = create(:user)
    entry = create(:entry, user_id: user.id)
    expect(entry.user.name).to eq('User name')
  end
  
  it "has a question" do
    user = create(:user)
    entry = create(:entry, user_id: user.id)
    expect(entry.question).to_not eq('')
  end
end