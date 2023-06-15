#class Breadcrumb < ApplicationRecord
# we don't need ApplicationRecord as we're not persisting to the database
class Breadcrumb
    attr_reader :text, :path

    def initialize(text, path)
        @text = text
        @path = path
    end

end
