class Entry < ApplicationRecord
    has_rich_text :content
    
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
            entries_contain = Entry.joins("INNER JOIN action_text_rich_texts ON action_text_rich_texts.record_id = entries.id").where("lower(action_text_rich_texts.body) LIKE ?", "%#{search}%")
            return entries_tagged + entries_contain
        end
    end
end
