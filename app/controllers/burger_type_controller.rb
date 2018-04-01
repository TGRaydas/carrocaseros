class BurgerTypeController < ApplicationController
  def update
    burger = BurgerType.find(params[:id])
    burger.update_attributes(burger_type_params)
  end

  def create
    BurgerType.create(burger_type_params)
  end

  def burger_type_params
    params.require(:burger_type).permit(:name)
  end
end
