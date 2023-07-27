class RemoveDescriptionFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :description, :text
  end
end
