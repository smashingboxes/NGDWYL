class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :goal
      t.string :submitted_by
      t.timestamps
    end
  end
end
