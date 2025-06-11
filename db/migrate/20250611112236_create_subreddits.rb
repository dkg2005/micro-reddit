class CreateSubreddits < ActiveRecord::Migration[8.0]
  def change
    create_table :subreddits do |t|
      t.text :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
