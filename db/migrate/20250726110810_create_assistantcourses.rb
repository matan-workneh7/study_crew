class CreateAssistantcourses < ActiveRecord::Migration[8.0]
  def change
    create_table :assistantcourses do |t|
      t.references :assistant, null: false, foreign_key: { to_table: :users }
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
