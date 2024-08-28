module Admin
  class PropertySituationsController < BaseController
    before_action :load_property_type, only: [:edit, :update, :destroy]

    def index
      @property_situations = PropertySituation.order(:name)
    end

    def new
      @property_situation = PropertySituation.new
    end

    def create
      @property_situation = PropertySituation.new property_situation_params
      if @property_situation.save
        redirect_to admin_property_situations_path, notice: 'Tipo de Imóvel criado com sucesso!'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit;end

    def update
      if @property_situation.update property_situation_params
        redirect_to admin_property_situations_path, notice: 'Tipo de Imóvel atualizado com sucesso!'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @property_situation.destroy
      redirect_to admin_property_situations_path, notice: 'Tipo de Imóvel excluído com sucesso!'
    end

    private

    def load_property_situation
      @property_situation = PropertySituation.find params[:id]
    end

    def property_situation_params
      params.require(:property_situation).permit(:name)
    end
  end
end

