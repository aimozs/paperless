class Programme < ActiveRecord::Base
  resourcify

  belongs_to :user
  has_many :specs
  has_many :exercises, through: :specs

  def self.reverse_order
    order(created_at: :desc)
  end
end
