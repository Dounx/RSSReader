class ChangeTitleUniquenessInFeeds < ActiveRecord::Migration[5.2]
  def change
    add_index :feeds, :title, unique: true, :length => 100
  end
end
