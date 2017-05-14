class AddColorToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :background_color, :string, default: '#005a55'
  end
end
