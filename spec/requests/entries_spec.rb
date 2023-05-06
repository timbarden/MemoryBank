require 'rails_helper'

RSpec.describe "Entries", type: :request do
  before do
    @user = create(:user)
    @entry = create(:entry, user_id: @user.id, question: "test", answer: "testanswer")
  end

  describe "GET index" do
    it "returns http success" do
      get entries_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns a successful new path" do
      get new_entry_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "returns a successful edit path" do
      get edit_entry_path(@entry)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "creates a new entry" do
      expect { create(:entry, user_id: @user.id) }.to change { Entry.count }.by(1)
    end
  end

  describe "POST delete" do
    it "delete an entry" do
      expect do
        delete entry_path(@entry)
      end.to change { Entry.count }.by(-1)
    end
  end

end
