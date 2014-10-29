class Message < ActiveRecord::Base

	belongs_to :user

	def self.reverse_order
    	order(created_at: :desc)
  	end

  	

end
