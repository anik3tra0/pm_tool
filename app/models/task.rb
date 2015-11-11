class Task < ActiveRecord::Base
	belongs_to :project

	validate :check_due_date

	private

	def check_due_date
    if !self.due_date.nil? && self.due_date < project.start_date
  errors.add(:due_date, "Invalid, should not be less than #{project.start_date}")
	end
end


end
