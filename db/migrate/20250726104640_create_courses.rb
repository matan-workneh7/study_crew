class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :code
      t.string :year
      t.integer :semester
      t.string :description
      t.integer :credit_hour

      t.timestamps
    end
  end
end
