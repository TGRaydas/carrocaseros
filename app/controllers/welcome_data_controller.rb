class WelcomeDataController < ApplicationController
  def index

  end
  def new
    @messege = WelcomeDatum.new
  end
  def create
    @messege = WelcomeDatum.create(params[:messege])
  end
  def update
    data = WelcomeDatum.find(params[:id])
    if data.update_attributes(data_params)

    end
  end

  def destroy

  end
  def data_params
    params.require(:welcome_datum).permit(:messege, :active)
  end
end
