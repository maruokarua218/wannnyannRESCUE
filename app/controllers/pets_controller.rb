class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy]
  before_action :set_q, only: [:index, :search]
  skip_before_action :login_required, only: [:index, :show, :search]

  def index
    @pets = Pet.all
    @users = User.all
  end

  def show
    @favorite = current_user.favorites.find_by(pet_id: @pet.id) if current_user
  end

  def new
    @pet = Pet.new
  end

  def edit
    @pet = Pet.find(params[:id])
    if @pet.user_id == current_user.id
      render "edit"
    else
      redirect_to pets_path
    end
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id

    respond_to do |format|
      if @pet.save
        format.html { redirect_to pet_url(@pet), notice: "ペットを投稿しました！" }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to pet_url(@pet), notice: "ペット情報を更新しました！" }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pet.destroy
    if @pet.user_id == current_user.id
      respond_to do |format|
        format.html { redirect_to pets_url, notice: "投稿を削除しました！" }
        format.json { head :no_content }
      end
    end
  end

  def confirm
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    render :new if @pet.invalid?
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Pet.ransack(params[:q])
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:image, :image_cache, :gender, :animal_type, :prefectures_name, :content, :gender, :animal_type, :prefectures_name)
  end
end
