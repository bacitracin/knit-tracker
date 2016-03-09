class RemoveGuageAddUseridToPatternsTable < ActiveRecord::Migration
  def change
    add_column :patterns, :user_id, :integer
    remove_column :patterns, :guage, :string
  end
end
