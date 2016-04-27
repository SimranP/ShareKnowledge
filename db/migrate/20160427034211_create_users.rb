class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :provider
      t.text :uid
      t.text :name
      t.text :image
      t.text :token
      t.datetime :expires_at

      t.timestamps null: false
    end
  end
end
