class Programme < ActiveRecord::Base
  belongs_to :user
  has_many :specs
  has_many :exercises, through: :specs

  accepts_nested_attributes_for :exercises
  accepts_nested_attributes_for :specs

  def self.reverse_order
    order(created_at: :desc)
  end
end
