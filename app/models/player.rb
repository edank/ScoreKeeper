class Player < ActiveRecord::Base
	validates :name,	presence: true, 
						uniqueness: {case_sensitive: false}
	validates_format_of :name, :with => /\A[-a-z ]+\Z/i
end
