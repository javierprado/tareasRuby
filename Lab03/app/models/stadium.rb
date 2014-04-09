class Stadium < ActiveRecord::Base
	validates :name, uniqueness: true {case_sensitive: false}, presence: true
	validates :city, uniqueness: true {case_sensitive: false}, presence: true, format: {with: /\A(Belo Horizonte|Brasilia|Cuiaba|Curitiba|Fortaleza|Manaus|Natal|Recife|Rio de Janeiro|Salvador|Sao Paulo)\z/i, message: "ERROR: Stadium City must be one of this: Belo Horizonte, Brasilia, Cuiaba, Curitiba, Fortaleza, Manaus, Natal, Recife, Rio de Janeiro, Salvador, Sao Paulo."}
	validates :photo, presence: true, format: { with: /\A[http|https]+[:]+[\W]{2}+[[w]{3}|\w]+[.]+[\w]+[\w|\W]+\z/}
	validates :capacity, presence: true, numericality: {only_integer: true}, numericality: {greater_than: 0}
	validates :construction_date, presence: true
end
