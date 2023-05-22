class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns, force: :cascade do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :campaigns, :name, unique: true
  end
end
