class SayController < ApplicationController

  def hello
  	
  	@clients_count = Client.count
  	@projects_count = Project.count
  	@tasks_count = Task.count
  	@clients = Client.all 
    @projects = Project.all
    @tasks = Task.all
  end 



end
