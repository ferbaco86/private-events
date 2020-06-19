class AddCreatorIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :events, :creator
  end
end
