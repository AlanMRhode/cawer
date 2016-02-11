class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string :biography
    	t.string :age
    	t.string :location
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
