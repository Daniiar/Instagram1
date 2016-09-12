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

ball = Photography.create(name: 'My ball', 
						  image: File.new(fixtures_photographies_path.join('ball.jpg')), 
						  user_id: farid.id)

cola = Photography.create(name: 'Coca-cola', 
						  image: File.new(fixtures_photographies_path.join('cola.jpg')), 
						  user_id: farid.id)


farid_read_gilany = Relationship.create(follower_id: farid.id, followed_id: gilani.id)
gilani_read_farid = Relationship.create(follower_id: gilani.id, followed_id: farid.id)

comment_farid_for_ball = Comment.create(title: 'is it Tennis?', photography_id: ball.id, user_id: farid.id)
comment_gilani_for_ball = Comment.create(title: 'Yes, Farid', photography_id: ball.id, user_id: gilani.id)

ball.liked_by farid
ball.liked_by gilani
cola.liked_by farid
cola.liked_by gilani