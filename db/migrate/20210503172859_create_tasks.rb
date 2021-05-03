class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.string :urgency
      t.integer :user_id
      t.integer :bug_id

      t.timestamps
    end
  end
end
