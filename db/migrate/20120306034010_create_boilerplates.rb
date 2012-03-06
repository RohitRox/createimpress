class CreateBoilerplates < ActiveRecord::Migration
  def change
    create_table :boilerplates do |t|
      t.text :head
      t.text :base_file
      t.text :foot

      t.timestamps
    end
  end
end
