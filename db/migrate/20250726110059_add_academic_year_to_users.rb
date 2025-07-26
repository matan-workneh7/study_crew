class AddAcademicYearToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :academic_year, :integer
  end
end
