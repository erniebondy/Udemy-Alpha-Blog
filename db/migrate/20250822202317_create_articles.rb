class CreateArticles < ActiveRecord::Migration[8.0]
  def change

    ## This is like defining the columns of the 'articles' table
    create_table :articles do |t|
      t.string :title
    end
  end
end
