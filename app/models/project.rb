class Project < ActiveRecord::Base
	#id, name, description,status, start_Date, created_at,updated_at
	#readers/writers
    has_many :project_categories
    has_many :categories, through: :project_categories

	has_many :tasks
	belongs_to :client
	belongs_to :user 

	validates_presence_of :name, :status, :start_date, :client_id
	validates_presence_of :start_date, message: "should be selected"
	validates_numericality_of :client_id
	validates_uniqueness_of :name, scope_to: :client_id
	validate :check_start_date
	before_create :generate_code

def details
	"#{name} - #{status} - #{start_date} - #{description} - #{Client.find(client_id).name}"
end

def self.show_projects(start_date,end_date)
	Project.where('start_date >= ? AND start_date <= ?', start_date,end_date)
end

def self.completed
	Task.where("is_completed = ?", true)

end

def self.incomplete
	Task.where("is_completed = ?", false)

end

def self.overdue(date)
	Task.where("due_date < ? AND is_completed = ?", date,false)

end

def self.completed_project(project)
	project.tasks.where("is_completed = ?", true)

end

def self.incomplete_project(project)
  project.tasks.where("is_completed = ?", false)
end

def self.overdue_project(date,project)
	project.tasks.where("due_date < ? AND is_completed = ?", date,false)
  
end
 private

 def generate_code
 	self.code = "#{Random.rand(1000)}"
 end

 def check_start_date
if !self.start_date.nil? && self.start_date < Date.today
	errors.add(:start_date, "Date is invalid. Should not be less than #{Date.today}")
 end
end





end
