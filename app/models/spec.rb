class Spec < ActiveRecord::Base
  belongs_to :programme
  belongs_to :exercise

  def self.reverse_order
    order(created_at: :desc)
  end
end
