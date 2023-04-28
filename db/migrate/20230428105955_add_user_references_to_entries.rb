class AddUserReferencesToEntries < ActiveRecord::Migration[7.0]
  def change
    add_reference :entries, :user
  end
end
