class Row
	
	def initialize 
		@squares = []
		
	end
	def squares
		@squares
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
	
	def occupied_by
		if occupied_by_same_user?
			return :x if @squares.all?{|square| square.input = :x  }
			return :o if @squares.all?{|square| square.input = :o  }
		else
			 "Nobody"
		end
	end
end