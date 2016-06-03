class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
