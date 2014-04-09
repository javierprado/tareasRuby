class Group < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: {is: 1}
end
