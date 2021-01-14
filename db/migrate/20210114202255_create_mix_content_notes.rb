class CreateMixContentNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :mix_content_notes do |t|
      t.string :note 
      t.integer :mix_id
      t.integer :content_id
      t.timestamps
    end
  end
end
