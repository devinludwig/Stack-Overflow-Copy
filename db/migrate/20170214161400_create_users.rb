class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.column :name, :string
      
      t.timestamps
    end
    create_table :questions do |t|
      t.column :content, :string
      t.column :rating, :integer
      t.column :user_id, :integer

      t.timestamps
    end
    create_table :answers do |t|
      t.column :content, :string
      t.column :rating, :integer
      t.column :user_id, :integer
      t.column :question_id, :integer

      t.timestamps
    end
  end
end
