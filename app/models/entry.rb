class Entry < ApplicationRecord
    belongs_to :user
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    validates :question, presence: true

    def self.tagged_with(name)
        tags = Tag.find_by(name: name)
        if !tags.nil?
            tags.entries
        end
    end

    def self.search(search)
        if search
            entry_search = Entry.where("lower(question) LIKE ?", "%#{search}%")
            if entry_search
                self.where(id: entry_search).order("created_at DESC")
            end
        end
    end
end
