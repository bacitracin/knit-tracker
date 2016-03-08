class CreatePatterns < ActiveRecord::Migration

  def change
    create_table :patterns do |t|
      t.string :pattern_name
      t.string :pattern_category
      t.boolean :free_pattern
      t.string :pattern_url
      t.string :suggested_yarn
      t.string :yarn_weight
      t.string :guage
      t.string :needle_size
      t.integer :yardage
      t.string :pattern_notes
      t.string :password_digest
    end
  end
end