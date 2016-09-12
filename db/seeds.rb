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
						  image: File.new(fixtures_photographies_path.join('ball.jpg'), 
						  user_id: farid.id))