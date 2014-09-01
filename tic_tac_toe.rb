#ruby-2.0.0

=begin
	The board has rows. Rows have squares. Squares are filled with x's or O's	
=end

class Square
	attr_reader :input
	
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

class Row
	attr_reader :squares
	def initialize 
		@squares = []
		
	end
	
	def squares= *squares
		squares.each{|x| @squares << x unless occupied? } 
	end

	def occupied?
		@squares.size >= 3
	end

	def occupied_by_same_user?
		return false unless occupied
		return @squares.all?{|square| square.input = :x  } || 
				@squares.all?{|square| square.input = :o  }
	end
end

class Board 
	def initialize
		#squares counted left to right
		@squares = []
		9.times{|i| @squares[i] = Square.new }
		#rows counted left to right, top to bottom,
		# and cross right-top-to-left-bottom and vice 
		@rows = []
		9.times{|i| @rows[i] = Row.new()}
		@rows[1].squares = @squares[1], @squares[4], @squares[7]
		@rows[2].squares = @squares[2], @squares[5], @squares[8]
		@rows[3].squares = @squares[3], @squares[6], @squares[9]
		@rows[4].squares = @squares[1], @squares[2], @squares[3]
		@rows[5].squares = @squares[4], @squares[5], @squares[6]
		@rows[6].squares = @squares[7], @squares[8], @squares[9]
		@rows[7].squares = @squares[3], @squares[5], @squares[7]
		@rows[8].squares = @squares[1], @squares[5], @squares[9]

	end

	def game_ended?
		@rows.all?{ |r| r.occupied? }
	end
end

game_board = Board.new
game_board.game_ended?