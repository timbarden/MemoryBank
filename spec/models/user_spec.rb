require "rails_helper"

RSpec.describe User, type: :model do
    it "has an email address" do
        user = User.create!(email: 'user1@example.com', password: 'password')
        expect(user.email).to eq('user1@example.com')
    end
    
    it "has a password" do
        user = User.create!(email: 'user2@example.com', password: 'password')
        expect(user.password).to eq('password')
    end
end