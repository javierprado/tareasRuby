class Team < ActiveRecord::Base
	validates :name, uniqueness: true
	validates :coach, uniqueness: true
	validates :name, :coach, :flag, :uniform, :text, presence: true
	validates :name, format: { with: /\A[a-zA-Z]+\z/}
	validates :coach, presence: true
	validates :flag, format: { with: /\A[http|https]+[:]+[\W]{2}+[[w]{3}|\w]+[.]+[\w]+[\w|\W]+\z/}
	validates :uniform, format: { with: /\A[http|https]+[:]+[\W]{2}+[[w]{3}|\w]+[.]+[\w]+[\w|\W]+\z/}
	validates :text, length: { in: 15..200 }
end
