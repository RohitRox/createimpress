class AddentitiesToImpresses < ActiveRecord::Migration
   def change
    add_column :impresses, :title, :string
    add_column :impresses, :slide_pack, :text
  end
end

