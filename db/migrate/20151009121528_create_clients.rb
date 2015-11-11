class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :name
    	t.string :company_name
    	t.string :email_id
    	t.string :website

      t.timestamps null: false
    end
  end
end
