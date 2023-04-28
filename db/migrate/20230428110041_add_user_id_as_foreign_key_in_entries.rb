class AddUserIdAsForeignKeyInEntries < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "entries", "users"
  end
end
