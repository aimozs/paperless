class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :messages

  has_many :relationships, foreign_key: "trainer_id", dependent: :destroy
	has_many :clients, through: :relationships

	has_many :reverse_relationships, foreign_key: "client_id", class_name: "Relationship", dependent: :destroy
	has_many :trainers, through: :reverse_relationships

  def training?(other_user)
  	relationships.find_by(client_id: other_user.id)
	end

	def enroll!(client)
    relationships.create!(client_id: client.id)
  end

  def has_trainer?
    reverse_relationships.any?
  end
end
