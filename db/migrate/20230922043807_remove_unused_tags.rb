class RemoveUnusedTags < ActiveRecord::Migration[7.0]
  def change
    Tag.all.find_each do |t|
      if !Tagging.exists?(tag_id: t.id)
        t.destroy
      end
    end
  end
end