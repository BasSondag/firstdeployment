class CreateSecrets < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.text :conten
      t.references :user, index: true

      t.timestamps
    end
  end
end
