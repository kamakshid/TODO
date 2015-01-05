class Task < ActiveRecord::Base

	validates :name, length: {maximum: 140}, presence: true
	validates :is_completed, inclusion: [true, false] 

end
