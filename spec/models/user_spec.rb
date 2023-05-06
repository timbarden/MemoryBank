require "rails_helper"

RSpec.describe User, type: :model do
    before do
        @user = create(:user)
    end

    it "has an email address" do
        expect(@user.email).to_not eq('')
    end
    
    it "has a password" do
        expect(@user.password).to_not eq('')
    end
end