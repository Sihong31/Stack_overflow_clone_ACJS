class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :question
      t.references :answer
      t.references :user
      t.text :body
      t.timestamps null: false
    end
  end
end
