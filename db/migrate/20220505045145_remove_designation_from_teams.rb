class RemoveDesignationFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :designation, :string
  end
end
