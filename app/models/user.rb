class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :name, presence: true, length: {maximum: 50}

	has_attached_file :avatar,
		styles: {medium: '100x100>', thumb: '50x50>'},
		default_url: '/images/:style/missing.png'

		validates_attachment_content_type :avatar,
			content_type: ['image/jpeg', 'image/gif', 'image/png']

	has_many :photographies
	has_many :comments, dependent: :destroy
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy

	has_many :followed_users, through: :relationships, source: :followed

	def following?(other_user)
		relationships.find_by(followed_id: other_user)
		# relationships.find_by(followed_id: other_user.id)posle izmenenii ne srabotal
	end

	def follow!(other_user)
		relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
		relationships.find_by(followed_id: other_user.id).destroy!
	end

	has_many :reverse_relationships, foreign_key: "followed_id", 
									 class_name: "Relationship", 
									 dependent: :destroy

	has_many :followers, through: :reverse_relationships, source: :follower

	acts_as_voter

end