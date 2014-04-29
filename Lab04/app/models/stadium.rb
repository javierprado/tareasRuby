class Stadium < ActiveRecord::Base
	has_many :matches

	validates :name, presence: true, uniqueness: true, uniqueness: {case_sensitive: false}, format: {with: /\A[A-Za-z ]+\z/, message: "ERROR: Only letters and spaces allowed in Stadium Name"}
	validates :city, presence: true, uniqueness: true, uniqueness: {case_sensitive: false}, format: {with: /\A(Belo Horizonte|Brasilia|Cuiaba|Curitiba|Fortaleza|Manaus|Natal|Recife|Rio de Janeiro|Salvador|Sao Paulo)\z/i, message: "ERROR: Stadium City must be one of this: Belo Horizonte, Brasilia, Cuiaba, Curitiba, Fortaleza, Manaus, Natal, Recife, Rio de Janeiro, Salvador, Sao Paulo."}
	validates :construction_date, presence: true #Atributo tipo Date revisa que sea una fecha valida
	validates :capacity, presence: true, numericality: {only_integer: true}, numericality: {greater_than: 0}
	validates :photo, presence: true, format: {with: /http(s)?:\/\/[A-Za-z0-9+&@#%?=~_|\.|\-|\/]+/i, message: "ERROR: Invalid Stadium URL"}
end
