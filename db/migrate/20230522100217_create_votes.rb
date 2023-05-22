class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :campaign, null: false, foreign_key: true
      t.string :candidate
      t.integer :validity
      t.integer :timestamp

      t.timestamps
    end
  end
end
