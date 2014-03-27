module Action
	def jump
		@distance = rand(4) + 2
		puts "I jumped forward #{@distance} feet!"
	end

	def run
		@distance = 10
		@time = rand(4) + 1
		sleep(@time)
		puts "Recorre #{@distance} metros en #{@time} segundo(s)"
	end
end

class Rabbit
	include Action
	
	attr_reader :name
	
	def initialize(name)
		@name = name
	end
end

class Cricket
	include Action
	
	attr_reader :name
	
	def initialize(name)
		@name = name
	end

	def chirp
		rnd = rand(90).to_i + 10
		cnt = 0
		while cnt < rnd
			puts "cri cri!!"
			cnt += 1
		end
	end
end

peter = Rabbit.new("Juan")
jiminy = Cricket.new("Javier")

#peter.run
#jiminy.jump
#jiminy.chirp