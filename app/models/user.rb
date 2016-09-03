class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :name, presence: true, length: {maximum: 50}

	has_attached_file :image,
		styles: {medium: '300x300>', thumb: '100x100>'},
		default_url: '/images/:style/missing.png'

		validates_attachment_content_type :image,
			content_type: ['image/jpeg', 'image/gif', 'image/png']

	has_many :photographies

end
