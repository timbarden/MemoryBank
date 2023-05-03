require "rails_helper"

RSpec.describe Entry, type: :model do
  it "has an assigned user" do
    user = User.create!(id: 3, name: 'user name', email: 'user3@example.com', password: 'password')
    entry = Entry.create!(question: "What is a question?", user_id: 3)
    expect(entry.user.name).to eq('user name')
  end
end