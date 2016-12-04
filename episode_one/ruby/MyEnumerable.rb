#
# This module is a re-implementation of Ruby's `Enumerable`:
#
#   https://docs.ruby-lang.org/en/2.0.0/Enumerable.html
#
# A class that includes this module should implement this method:
#
#   `each`
#     yields each element.
#
# Every method in this module uses `each`.
#
## <E: ..Object?>
##   #each: &{E -> void} -> void
module MyEnumerable
	#
	# `all?`
	#   returns `true` if all elements satisfy the block,
	#   or `false` otherwise.
	#
	# Example:
	#
	#   a = MyArray[2, 3, 5]
	#   a.all? { |e| e.odd? } # => false
	#
	# Write about 6 lines of code for this method.
	#
	## &{E -> boolean} -> boolean
	def all?
		each do |e|
            if not yield(e)
                return false
            end
        end
        return true
	end

	#
	# `any?`
	#   returns `true` if any elements satisfy the block,
	#   or `false` otherwise.
	#
	# Example:
	#
	#   a = MyArray[2, 3, 5]
	#   a.any? { |e| e.odd? } # => true
	#
	# Write about 6 lines of code for this method.
	#
	## &{E -> boolean} -> boolean
	def any?
        each do |e|
            if yield(e)
                return true
            end
        end
        return false
	end

	#
	# `count`
	#   returns how many elements satisfy the block.
	#
	# Example:
	#
	#   a = MyArray[2, 3, 5]
	#   a.count { |e| e.odd? } # => 2
	#
	# Write about 7 lines of code for this method.
	#
	## &{E -> boolean} -> Integer
	def count
        cpt = 0
		each do |e|
            if yield(e)
                cpt += 1
            end
        end
        return cpt
	end

	#
	# `find`
	#   returns the first satisfying element, if any,
	#   or `nil` otherwise.
	#
	# Example:
	#
	#   a = MyArray[2, 3, 5]
	#   a.find { |e| e.odd? } # => 3
	#
	# Write about 6 lines of code for this method.
	#
	## &{E -> boolean} -> E?
	def find
		each do |e|
            if yield(e)
                return e
            end
        end
        return nil
	end

	#
	# `find_index`
	#   returns the index of the first satisfying element, if any,
	#   or `nil` otherwise.
	#
	# Example:
	#
	#   a = MyArray[2, 3, 5]
	#   a.find_index { |e| e.odd? } # => 1
	#
	# Write about 8 lines of code for this method.
	#
	## &{E -> boolean} -> Integer?
	def find_index
        cpt = 0
		each do |e|
            if yield(e)
                return cpt
            end
            cpt += 1
        end
        return nil
	end

	#
	# `first`
	#   returns the first element, if any,
	#   or `nil` otherwise.
	#
	# Example:
	#
	#   a = MyArray[2, 3, 5]
	#   a.first # => 2
	#
	# Write about 4 lines of code for this method.
	#
	## -> E?
	def first
		each do |e|
            return e
        end
	end

	#
	# `map`
	#   returns a new array of the results of the block for each element.
	#
	# Example:
	#
	#   a = MyArray[2, 3, 5]
	#   a.map { |e| e.odd? } # => MyArray[false, true, true]
	#
	# Write about 5 lines of code for this method.
	#
	## <T: ..Object?> &{E -> T} -> MyArray<T>
	def map
		arr = MyArray[]
        each do |e|
            arr.push(yield(e))
        end

        return arr
	end

	#
	# `reject`
	#   returns a new array of all non-satisfying elements.
	#
	# Example:
	#
	#   a = MyArray[2, 3, 5]
	#   a.reject { |e| e.odd? } # => MyArray[2]
	#
	# Write about 7 lines of code for this method.
	#
	## &{E -> boolean} -> MyArray<E>
	def reject
        arr = MyArray[]
        each do |e|
            if not yield(e)
                arr.push(e)
            end
        end

        return arr
	end

	#
	# `select`
	#   returns a new array of all satisfying elements.
	#
	# Example:
	#
	#   a = MyArray[2, 3, 5]
	#   a.select { |e| e.odd? } # => MyArray[3, 5]
	#
	# Write about 7 lines of code for this method.
	#
	## &{E -> boolean} -> MyArray<E>
	def select
        arr = MyArray[]
        each do |e|
            if yield(e)
                arr.push(e)
            end
        end

        return arr
	end
end
