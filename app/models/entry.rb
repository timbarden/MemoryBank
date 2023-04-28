class Entry < ApplicationRecord
    belongs_to :user
    validates :question, presence: true

    def self.search(search)
        if search
            entry_search = Entry.where("lower(question) LIKE ?", "%#{search}%")
            if entry_search
                self.where(id: entry_search).order("created_at DESC")
            end
        end
    end
end
