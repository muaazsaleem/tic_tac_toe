class Square
	attr_accessor :input
	
	def input= input
		if valid_user? input
			@input = input.to_sym
		else
			puts "Invalid User"
		end
	end

	def valid_user? letter
		(letter == "x") || (letter == "o")
	end

	
end




