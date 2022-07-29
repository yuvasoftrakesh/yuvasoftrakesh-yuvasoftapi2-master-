class AddDesignationIdToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :designation_id, :integer
  end
end
