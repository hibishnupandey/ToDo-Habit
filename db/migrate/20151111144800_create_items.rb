class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :description
      t.date :due_date
      t.string :status, :default=>'New'
      t.timestamps
    end
  end
end
