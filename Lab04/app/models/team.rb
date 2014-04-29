class Team < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true, uniqueness: {case_sensitive: false}, format: {with: /\A[A-Za-z ]+\z/, message: "ERROR: Only letters and spaces allowed in Team Name"}
	validates :coach, presence: true, uniqueness: true, uniqueness: {case_sensitive: false}
	validates :flag, presence: true, format: {with: /http(s)?:\/\/[A-Za-z0-9+&@#%?=~_|\.|\-|\/]+/i, message: "ERROR: Invalid Flag URL"}
	validates :uniform, presence: true, format: {with: /http(s)?:\/\/[A-Za-z0-9+&@#%?=~_|\.|\-|\/]+/i, message: "ERROR: Invalid Uniform URL"}
	validates_length_of :info, minimum: 15, maximum: 200

	has_one :participations
	has_one :groups, :through => :participations
	has_many :matches
end
