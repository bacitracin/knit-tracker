class ChangeFreeFormatInPatternsTable < ActiveRecord::Migration
  def change
    change_column :patterns, :free_pattern, :string
  end
end
