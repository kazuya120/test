class RenameBlogColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :blog, :blog_id
  end
end
