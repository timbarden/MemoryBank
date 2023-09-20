class MoveAnswerToActionText < ActiveRecord::Migration[7.0]
  def change
    Entry.all.find_each do |e|
      e.update(content: e.answer)
    end
    remove_column :entries, :answer
  end
end
