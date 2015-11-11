object @client
attributes :id, :name, :company, :website

	node(:edit_url) {|client| edit_client_url(client)}

child :user do
	attributes :id, :email, :sign_in_count
end

child :projects do
	attributes :id, :name, :start_date, :description
		node(:show_url) {|project| project_url(project)}
end