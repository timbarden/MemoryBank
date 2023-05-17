class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :entries, through: :taggings
end
