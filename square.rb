class Square
	attr_reader :input
	def initialize input = " "
		@input = input
	end
	def input= input 
		if valid_input? input 
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




