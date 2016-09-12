fixtures_path = Rails.root.join('app', 'assets', 'images', 'avatars')
fixtures_photographies_path = Rails.root.join('app', 'assets', 'images', 'photographies')

farid = User.create(avatar: File.new(fixtures_path.join('farid.jpg')),
					name: 'Farid', 
					email: 'farid@gmail.com', 
					password: '123456', 
					password_confirmation: '123456')
gilani = User.create(avatar: File.new(fixtures_path.join('gilani.jpg')),
					name: 'Gilani', 
					email: 'gilani@gmail.com', 
					password: '123456', 
					password_confirmation: '123456')
omurbek = User.create(avatar: File.new(fixtures_path.join('omurbek.jpg')),
					name: 'Omurbek', 
					email: 'omurbek@gmail.com', 
					password: '123456', 
					password_confirmation: '123456')

ball = Photography.create(name: 'My ball', 
						  image: File.new(fixtures_photographies_path.join('ball.jpg')), 
						  user_id: farid.id)
cola = Photography.create(name: 'Coca-cola', 
						  image: File.new(fixtures_photographies_path.join('cola.jpg')), 
						  user_id: gilani.id)
sony_zeus = Photography.create(name: 'My new phone', 
						  image: File.new(fixtures_photographies_path.join('sony_zeus.jpg')), 
						  user_id: omurbek.id)

farid_read_gilany = Relationship.create(follower_id: farid.id, followed_id: gilani.id)
farid_read_omurbek = Relationship.create(follower_id: farid.id, followed_id: omurbek.id)
gilani_read_farid = Relationship.create(follower_id: gilani.id, followed_id: farid.id)
gilani_read_omurbek = Relationship.create(follower_id: gilani.id, followed_id: omurbek.id)
omurbek_read_farid = Relationship.create(follower_id: omurbek.id, followed_id: farid.id)
omurbek_read_gilani = Relationship.create(follower_id: omurbek.id, followed_id: gilani.id)

comment_farid_for_ball = Comment.create(title: 'is it Tennis?', photography_id: ball.id, user_id: farid.id)
comment_omurbek_for_ball = Comment.create(title: 'yes, its very interest', photography_id: ball.id, user_id: omurbek.id)
comment_gilani_for_ball = Comment.create(title: 'Yes, Farid', photography_id: ball.id, user_id: gilani.id)
comment_farid_for_cola = Comment.create(title: 'Who like cola', photography_id: cola.id, user_id: farid.id)
comment_omurbek_for_cola = Comment.create(title: 'i liked', photography_id: cola.id, user_id: omurbek.id)
comment_gilani_for_cola = Comment.create(title: 'im not', photography_id: cola.id, user_id: gilani.id)
comment_farid_for_sony_zeus = Comment.create(title: 'its my new phone', photography_id: sony_zeus.id, user_id: farid.id)
comment_omurbek_for_sony_zeus = Comment.create(title: 'super', photography_id: sony_zeus.id, user_id: omurbek.id)
comment_gilani_for_sony_zeus = Comment.create(title: 'cool phone', photography_id: sony_zeus.id, user_id: gilani.id)

ball.liked_by farid
ball.liked_by gilani
cola.liked_by farid
cola.liked_by gilani

5.times do 
	user = User.create(avatar: Faker::Avatar.image,
					name: Faker::Name.name, 
					email: Faker::Internet.email, 
					password: '123456', 
					password_confirmation: '123456')
end