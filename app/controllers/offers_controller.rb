class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]


  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)

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


  def destroy
    @offer.destroy
      redirect_to offers_url, notice: 'Oferta excluída com sucesso.'
    end
  end

  private

    def set_offer
      @offer = Offer.find(params[:id])
    end


    def offer_params
      params.require(:offer).permit(:description)
    end
end
