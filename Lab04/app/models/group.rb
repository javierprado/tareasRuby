class Group < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true, uniqueness: {case_sensitive: false}, format: {with: /[A-Za-z]/, message: "ERROR: Only letters allowed"}
	validates_length_of :name, maximum: 1

	has_many :participations
	has_many :teams, :through => :participations
end
