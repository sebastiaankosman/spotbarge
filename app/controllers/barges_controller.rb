class BargesController < ApplicationController
  def index
    @barges = Barge.all
    # [ARA, Rhine]
    # barge_area=ARA,Rhine&capacity=skdhfds
    if params[:barge_areas]
      barge_areas_params = params[:barge_areas][1..]
      if barge_areas_params.length.positive?
        barge_areas_params.each do |area|
          @barges = @barges.by_area(area)
        end
      end
    end

    if params[:barge_types]
      barge_types_params = params[:barge_types][1..]
      if barge_types_params.length.positive?
        barge_types_params.each do |type|
          @barges = @barges.by_product(type)
        end
      end
    end
    @barges = @barges.by_volume(VOLUMES[params[:capacity].to_sym]) if params[:capacity] && params[:capacity].length.positive?
    @barges = @barges.by_load_window(Date.parse(params[:barge_load_window])) if params[:barge_load_window] && params[:barge_load_window].length.positive?
    # @barges = @barges.by_barge_area(params[:barge_area]) if params[:barge_area]
    # @barges

    @barges_with_coordinates = Barge.geocoded #returns flats with coordinates

    @markers = @barges_with_coordinates.map do |barge|
      {
        lat: barge.latitude,
        lng: barge.longitude
      }
    end
  end


  def new
    @barge = Barge.new
  end

  def create
    @barge = Barge.find(barge_params)
    if @barge.save!
      redirect_to barges_path(@barge)
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
