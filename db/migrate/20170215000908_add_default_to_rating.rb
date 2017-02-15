class AddDefaultToRating < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :rating, :integer
    remove_column :answers, :rating, :integer

    add_column :questions, :rating, :integer, :default => 0
    add_column :answers, :rating, :integer, :default => 0
  end
end
