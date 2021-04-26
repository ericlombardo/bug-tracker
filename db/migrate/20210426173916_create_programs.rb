class CreatePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :status
      t.text :description
      t.date :opened_date
      t.date :closed_date

      t.timestamps
    end
  end
end
