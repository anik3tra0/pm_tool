class AddClientIdToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :client_id, :integer
  	#add_column
  	#remove_column :table_name, :column_name
  end
end
