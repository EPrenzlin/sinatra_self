class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name 
      t.string :title 
      t.string :department
      t.integer :experience 
      t.string :useful
      t.integer :salary
    end

  end
end
