class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.string :category
      t.string :priority
      t.string :status
      t.string :overview
      t.text :description
      t.date :created
      t.text :notes
      t.text :next_steps
      t.string :update_for_client
      t.string :program_id

      t.timestamps
    end
  end
end
