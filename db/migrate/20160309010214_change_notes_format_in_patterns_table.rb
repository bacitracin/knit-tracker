class ChangeNotesFormatInPatternsTable < ActiveRecord::Migration
  def change
    change_column :patterns, :pattern_notes, :text
  end
end
