class Dessert
	attr_accessor :name
	attr_accessor :size
	attr_accessor :calories
	@@count = 0

	def initialize(name, calories)
		@name = name
		@calories = calories
		@@count += 1
	end
	
	def healthy?
		bool = false
		if @calories < 200
			true
		end if
		bool
	end
	
	def delicious?
		true
	end

	def set_name(name)
		@name = name
	end

	def set_size(size)
		@size = size
	end

	def set_calories(calories)
		@calories = calories
	end

	def get_name()
		@name
	end

	def get_size()
		@size
	end

	def get_calories()
		@calories
	end

	def count()
		@@count
	end
end

class JellyBean < Dessert
	attr_accessor :flavor
	
	def initialize(name, calories, flavor)
		@name = name
		@calories = calories
		@flavor = flavor

		@@count += 1
	end

	def delicious?
		bool = true
		if @flavor ==  "black licorice"
			bool = false
		end
		bool
	end

	def set_flavor(flavor)
		@flavor = flavor
	end

	def get_flavor()
		@flavor
	end
end

=begin
obj1 = Dessert.new("Pie Queso", 200)
puts obj1.count.to_s
obj2 = Dessert.new("Pie Melon", 100)
obj3 = JellyBean.new("Pie Melon", 100, "black licorice")
obj4 = JellyBean.new("Pie Melon", 100, "Other")
puts obj1.count
puts obj1.get_name
puts obj1.get_calories
puts obj1.delicious?
puts obj3.delicious?
puts obj4.delicious?
=end