class Profile < ActiveRecord::Base
  belongs_to :user

  def self.reverse_order
    order(created_at: :desc)
  end

  	after_create :make_client

  	def make_client
		self.user.add_role :client
	end
end
