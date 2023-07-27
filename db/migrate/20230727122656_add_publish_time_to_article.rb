class AddPublishTimeToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :publish_time, :datetime
  end
end
