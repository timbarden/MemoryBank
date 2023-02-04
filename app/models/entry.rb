class Entry < ApplicationRecord
    validates :question, presence: true

    def self.search(search)
        if search
            entry_search = Entry.where("lower(question) LIKE ?", "%#{search}%")
            if entry_search
                self.where(id: entry_search)
            end
        else
            @entries = Entry.all
        end
    end
end
