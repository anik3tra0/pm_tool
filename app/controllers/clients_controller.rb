class ClientsController < ApplicationController

  load_and_authorize_resource

	def index
		@clients = (current_user.role? "sales") ? Client.all : current_user.clients
	end

	def new
  @client = Client.new
  end

  def create 
  @client = Client.new(client_params)
  if @client.save
  	redirect_to clients_path
  else
  	render action: "new"
  end
end

def show
  @client = (current_user.role? "sales") ? Client.find(params[:id]) : current_user.clients.find(params[:id])
  @projects = @client.projects
end

def edit
begin
  @client = current_user.clients.find(params[:id])
rescue ActiveRecord::RecordNotFound
  redirect_to clients_path
  end 
end  

def update
  @client = Client.find(params[:id])
  if @client.update_attributes(client_params)
    redirect_to client_path(@client)
  else
    render action: "edit"
  end
end

def destroy
  begin
@client = Client.find(params[:id])
@client.destroy
redirect_to clients_path(@client)
 rescue ActiveRecord::RecordNotFound
redirect_to clients_path(@client) 
end
end




  private

  def client_params
  	params[:client].permit(:name, :company_name, :email_id, :mobile, :website)
end

end


# index - listing resources

# new - setting up object to be used in forms 
# create - insert the form record to the db
# show - to display a single resource
# edit - find the record to be edited
# update - 
