class RenameTitleToNameInSubseddits < ActiveRecord::Migration[8.0]
  def change
    rename_column :subseddits, :title, :name
  end
end
