class User < ActiveRecord::Base
  rolify
  before_create :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :messages
  has_many :programmes

  has_many :relationships, foreign_key: "trainer_id", dependent: :destroy
	has_many :clients, through: :relationships

	has_many :reverse_relationships, foreign_key: "client_id", class_name: "Relationship", dependent: :destroy
	has_many :trainers, through: :reverse_relationships



  def set_default_role
    if Client.find_by(email: email)
      self.add_role :client
      self.remove_role :trainer
    else
      self.add_role :trainer
      self.remove_role :client
    end
  end

  def training?(other_user)
  	relationships.find_by(client: other_user)
	end

	def enroll(client)
    relationship.create!(client: client)
  end

  def has_trainer?
    reverse_relationships.any?
  end

  def my_trainer
    reverse_relationships.first.trainer.profile
  end

end
