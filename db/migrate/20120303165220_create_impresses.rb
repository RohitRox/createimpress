class CreateImpresses < ActiveRecord::Migration
  def change
    create_table :impresses do |t|

      t.timestamps
    end
  end
end
