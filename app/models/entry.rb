class Entry < ApplicationRecord
    belongs_to :user
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    validates :question, presence: true

    def self.tagged_with(name)
        return Entry.joins(:tags).where("lower(name) = ?", name.downcase)
    end

    def self.search(search)
        if search
            search = search.downcase
            entries_tagged = Entry.tagged_with(search)
            entries_contain = Entry.where("lower(question) LIKE ?", "%#{search}%").or(Entry.where("lower(answer) LIKE ?", "%#{search}%"))
            return entries_tagged + entries_contain
        end
    end
end
