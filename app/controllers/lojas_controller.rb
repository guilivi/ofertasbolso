class LojasController < ApplicationController
  before_action :set_loja, only: [:show, :edit, :update, :destroy]


  def index
    @lojas = Loja.all
  end

  def show
  end

  def new
    @loja = Loja.new
  end

  def edit
  end

  def create
    @loja = Loja.new(loja_params)

      if @loja.save
        redirect_to @loja, notice: 'Loja criada com sucesso.'
      else
        render :new
      end
  end

  def update
      if @loja.update(loja_params)
        redirect_to @loja, notice: 'Loja was successfully updated.'
      else
        render :edit
  end

  def destroy
    @loja.destroy
    edirect_to lojas_url, notice: 'Loja was successfully destroyed.'
    end
  end

  private

    def set_loja
      @loja = Loja.find(params[:id])
    end

    def loja_params
      params.require(:loja).permit(:description)
    end
end
