class CreateConnections < ActiveRecord::Migration[8.0]
  def change
    create_table :connections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :assistant, null: false, foreign_key: { to_table: :users }
      t.string :status
      t.string :telegram_username
      t.text :course_ids
      t.text :problem_description
      
      t.timestamps
    end
  end
end
