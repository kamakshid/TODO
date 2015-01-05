class String

	def smaller_than_v?(other_v)


		self.include?("v") ? new_self = self.split("v")[1] : new_self = self
		other_v.include?("v") ? new_other_v = other_v.split("v")[1] : new_other_v = other_v

		raise ArgumentError.new("Invalid Version Number.") unless (new_self.is_valid_version_number? && new_other_v.is_valid_version_number?)
		split_self = new_self.split(".")
		split_other_v = new_other_v.split(".")
		for split in [split_self, split_other_v]
			if split.length == 2
				split << "0"
			elsif split.length == 1
				split << "0"
				split << "0"
			end
		end

		if split_self[0].to_i < split_other_v[0].to_i
			return true
		elsif split_self[0].to_i == split_other_v[0].to_i
			if split_self[1].to_i < split_other_v[1].to_i
				return true
			elsif split_self[1].to_i == split_other_v[1].to_i
				if split_self[2].to_i < split_other_v[2].to_i
					return true
				end
			end
		end
		return false
	end

	def is_valid_version_number?
		if !self.is_a? String 
			return false
		end

		split = self.split(".")
		for part in split
			if !part.is_i?
				return false
			end
		end
		if split.length > 3
			return false
		end

		return true
	end

	def is_i?
       !!(self =~ /\A[0-9]+\z/)
    end

end