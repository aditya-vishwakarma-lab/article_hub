class ChangeDefaultInBlockedColumnInReaders < ActiveRecord::Migration[7.0]
  def change
    change_column_default :readers, :blocked, from: nil, to: false
  end
end
