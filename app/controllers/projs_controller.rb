class ProjsController < ApplicationController
  before_action :set_proj, only: [:show, :edit, :update, :destroy]

  #полный список твитов
  def index
    @projs = Proj.all
  end

  #каждый твит
  def show
  end

  # для создания нового твита
  def new
    @proj = Proj.new
  end

  # для редактирования существующего твита
  def edit
  end

  # создает новый твит
  def create
    @proj = Proj.new(proj_params)

    respond_to do |format|
      if @proj.save
        format.html { redirect_to @proj, notice: 'Proj was successfully created.' }
        format.json { render :show, status: :created, location: @proj }
      else
        format.html { render :new }
        format.json { render json: @proj.errors, status: :unprocessable_entity }
      end
    end
  end

  # обновляет данные существующего твита
  def update
    respond_to do |format|
      if @proj.update(proj_params)
        format.html { redirect_to @proj, notice: 'Proj was successfully updated.' }
        format.json { render :show, status: :ok, location: @proj }
      else
        format.html { render :edit }
        format.json { render json: @proj.errors, status: :unprocessable_entity }
      end
    end
  end

  # удаляет твит
  def destroy
    @proj.destroy
    respond_to do |format|
      format.html { redirect_to projs_url, notice: 'Proj was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # устанавливает твит.
    def set_proj
      @proj = Proj.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proj_params
      params.require(:proj).permit(:title, :string, :content)
    end
end
