class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show edit update destroy ]

  # GET /photos or /photos.json
  def index

    @photos_classified = Photo.all.where("label != ''", 'photo')

    respond_to do |format|
      format.xlsx {
        response.headers[
            'Content-Disposition'
        ] = "attachment; filename='Clasificación de imágenes.xlsx"
      }
      format.html { render :index }
    end

  end

  # GET /photos/1 or /photos/1.json
  def show

  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos or /photos.json
  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to :root  }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    respond_to do |format|
      if Photo.maximum(:id) == @photo.id
        if @photo.update(photo_params)
          format.html { redirect_to root_path}
        end
      else
        if @photo.update(photo_params)
          format.html { redirect_to edit_photo_path(@photo.id+1)}
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @photo.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_photo
      @photo = Photo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def photo_params
    params.require(:photo).permit(:image, :label, :description)
  end
end