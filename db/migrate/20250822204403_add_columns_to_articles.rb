class AddColumnsToArticles < ActiveRecord::Migration[8.0]
  def change
    ## migration_command :table_name, :column_name, :data_type
    add_column :articles, :description, :text
  end
end
