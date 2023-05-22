class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes, force: :cascade do |t|
      t.references :campaign, null: false, foreign_key: true
      t.string :choice, null: false
      t.integer :validity, null: false
      t.datetime :voted_at, null: false

      t.timestamps
    end
  end
end
