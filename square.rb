class Square
	attr_reader :input
	
	def input= input
		if valid_user? input = " "
			@input = input.to_sym
		else
			puts "Invalid User"
		end
	end
	private
		def valid_input? letter
			(letter == "x") || (letter == "o") ||
			 (letter == :x) || (letter == :o) || (letter == " ")
		end

	
end




