class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @offers = Offer.all.order("created_at DESC")
  end

  def show
  end

  def new
    @offer = current_admin.offers.build
  end

  def edit
  end

  def create
    @offer = current_admin.offers.build(offer_params)
      if @offer.save
        redirect_to @offer, notice: 'Oferta criada com sucesso.'
      else
        render :new
      end
  end

  def update
      if @offer.update(offer_params)
        redirect_to @offer, notice: 'Oferta atualizada com sucesso.'
      else
        render :edit
      end
  end


  def destroy
    @offer.destroy
    redirect_to offers_url, notice: 'Oferta excluída com sucesso.'
  end

  private

    def set_offer
      @offer = Offer.find(params[:id])
    end

    def correct_admin
      @offer = current_admin.offers.find_by(id: params[:id])
      redirect_to offers_path, notice: "Você não tem autorização para editar esta oferta" if @offer.nil?
    end


    def offer_params
      params.require(:offer).permit(:description, :image)
    end
end
