class Exercise < ActiveRecord::Base

	has_many :specs
	has_many :programmes, through: :specs
	
	def self.reverse_order
    	order(created_at: :desc)
  	end
  	
	searchable do
    text :name
  end
  
end
