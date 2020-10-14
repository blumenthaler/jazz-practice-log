class AddNotesToJazzStandards < ActiveRecord::Migration
  def change
    add_column :jazz_standards, :notes, :text
  end
end
