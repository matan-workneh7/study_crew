class CreateConnections < ActiveRecord::Migration[8.0]
  def change
    create_table :connections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :assistant, null: false, foreign_key: { to_table: :user }
      t.text :course_ids
      t.text :problem_description
      t.string :telegram_username

      t.timestamps
    end
  end
end
