class PhotographiesController < ApplicationController
  def index
  	@photographies = Photography.all
  end

  def new
  	@photography = Photography.new
  end

  def create
  	@photography = Photography.new(photography_params)
  	image = params[:photography][:image]
  	unless image.nil?
      @photography.picture = params[:photography][:picture].original_filename
      upload_picture
    end
  	if @photography.save
  		redirect_to photographies_path
  	else
  		render 'new'
  	end
  end

  def show
  	@photography = Photography.find(params[:id])
  end

  def destroy
  	@photography = Photography.find(params[:id])
  	@photography.destroy

    redirect_to photographies_path
  end

  def edit
  	@photography = Photography.find(params[:id])
  end

  def update
  	@photography = Photography.find(params[:id])
  	if @photography.update(photography_params)
		redirect_to photographies_path
  	else
  		render 'edit'
  	end
  end

  private

  def photography_params
  	params.require(:photography).permit(:name, :image)
  end

  def upload_picture
    uploaded_file = params[:photography][:image]
	unless uploaded_file.nil?
		new_file_path = Rails.root.join('public', 'uploads', 'photographies', uploaded_file.original_filename)

		File.open(new_file_path, "wb") do |file|
		  file.write uploaded_file.read
		end
	end
  end
  
end
