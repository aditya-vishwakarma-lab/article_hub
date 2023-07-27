class RemoveTitleBodyFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :title, :string
    remove_column :comments, :body, :text
  end
end
