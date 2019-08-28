class BargesController < ApplicationController
  def index
    @barges = Barge.all
  end

  def new
    @barge = Barge.new
  end

  def create
    @barge = Barge.find(barge_params)
    if @barge.save!
      redirect_to barges_index_path(@barge)
    else
      render :new
    end
  end

  private

  # define barge params
  def barge_params
    params.require(:barge)
          .permit(:barge_name, :capacity, :barge_area,
                  :barge_load_window, :gas_free, :pre_cargo, :barge_type)
  end
end
