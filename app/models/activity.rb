class Activity < ApplicationRecord
	# validates :activity_name, presence: true, length: {minimum: 3, maximum: 50}
	validates :description, presence: true, length: {minimum: 280}
	validates :start_date, presence: true
	validates :end_date, presence: true
	# validates :location, presence: true, length: {minimum: 500}
	validates :mobile, presence: true, numericality: true
	validates :telephone, presence: true, numericality: true

	belongs_to :company
end
