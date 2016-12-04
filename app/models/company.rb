class Company < ApplicationRecord
	validates :company_name, presence: true, length: {minimum: 3, maximum: 50}
	validates :description, presence: true, length: {minimum: 280}
	# validates :location, presence: true, length: {minimum: 500}

	has_many :activities, dependent: :destroy
	belongs_to :user
end
