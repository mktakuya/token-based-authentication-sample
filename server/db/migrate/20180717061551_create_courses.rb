class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.integer :credit, null: false, default: 2
      t.string :instructor, null: false, default: ''
      t.text :content, null: false, default: ''

      t.timestamps
    end
    add_index :courses, :code, unique: true
  end
end
