require "rails_helper"

RSpec.describe User, type: :model do
    it "has an email address" do
        user = create(:user)
        expect(user.email).to_not eq('')
    end
    
    it "has a password" do
        user = create(:user)
        expect(user.password).to_not eq('')
    end
end