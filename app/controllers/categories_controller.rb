class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show ]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end

end
