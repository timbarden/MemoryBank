class AddFieldsToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :question, :string
    add_column :entries, :answer, :text
  end
end
