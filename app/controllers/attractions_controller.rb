class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    if params[:category].blank?
      @attractions = Attraction.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @attractions = Attraction.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def show
    if @attraction.reviews.blank?
      @average_review = 0
    else
      @average_review = @attraction.reviews.average(:rating).round(2)
    end
  end

  def new
    @attraction = current_user.attractions.build
    @categories = Category.all.map { |c| [c.name, c.id] }

  end

  def create
    @attraction = current_user.attractions.build(attraction_params)
    @attraction.category_id = params[:category_id]
    @attraction.item_img = params[:item_img]

    if @attraction.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def destroy
    @attraction.destroy
    redirect_to root_path
  end

  def update
    @attraction.category_id = params[:category_id]
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render 'edit'
    end

  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :description, :category_id, :item_img)
  end

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end

end