class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :decision
      t.references :user
      t.references :choice
      t.references :survey
    end
  end
end
