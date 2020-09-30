class CreateJazzStandards < ActiveRecord::Migration
  def change
    create_table :jazz_standards do |t|
      t.string :title
      t.string :composer
      t.string :recording
      t.string :performer
      t.integer :tempo
      t.string :levels_of_knowledge
      t.string :date_memorized
      t.integer :user_id
      t.timestamps null: false

    end
  end
end
