class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.user_id
      t.mix_id
      t.timestamps
    end
  end
end
