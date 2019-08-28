class BargesController < ApplicationController
  def index
    @barges = Barge.all

    if params[:barge_area]
      barges_by_area = []
      params[:barge_area].each do |area|
        barges_by_area += @barges.by_area(area)
      end
      @barges = barges_by_area
    end

    if params[:barge_type]
      barges_by_type = []
      params[:barge_type].each do |type|
        barges_by_type += @barges.by_product(type)
      end
      @barges = barges_by_type
    end

    @barges = @barges.by_volume(params[:capacity]) if params[:capacity]
    @barges = @barges.by_load_window(params[:barge_load_window]) if params[:barge_load_window]
    @barges = @barges.by_barge_area(params[:barge_area]) if params[:barge_area]
    @barges
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
