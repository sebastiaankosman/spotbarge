class CargosController < ApplicationController
  def index
    @cargos = Cargo.all
    if params[:load_location]
      load_location_params = params[:load_location][1..]
      if load_location_params.length.positive?
        load_location_params.each do |area|
          @cargos = @cargos.by_area(area)
        end
      end
    end

    if params[:cargo_type]
      cargo_type_params = params[:cargo_type][1..]
      if cargo_type_params.length.positive?
        cargo_type_params.each do |type|
          @cargos = @cargos.by_product(type)
        end
      end
    end
    @cargos = @cargos.by_volume(VOLUMES[params[:volume].to_sym]) if params[:volume] && params[:volume].length.positive?
    @cargos = @cargos.by_load_window(Date.parse(params[:cargo_load_window])) if params[:cargo_load_window] && params[:cargo_load_window].length.positive?
    # @cargos = @cargos.by_barge_area(params[:load_location]) if params[:load_location]
    # @cargos
    load_location
    cargo_type
  end

  def new
    @cargo = Cargo.new
    @cargos = Cargo.where(oil_company_id: current_user.oil_company.id)
    load_location
    cargo_type
  end

  def create
    @cargo = Cargo.find(cargo_params)
    if @cargo.save!
      redirect_to cargos_index_path(@cargo)
    else
      render :new
    end
  end

  def destroy
    @cargo = Cargo.find(params[:id])
    @cargo.destroy

    redirect_to new_cargo_path(Cargo.new), notice: "Delete success"
  end

  private

  def cargo_params
    params.require(:cargo)
          .permit(:cargo_name, :volume, :load_location,
                  :cargo_load_window, :gas_free, :cargo_type)
  end

  def cargo_type
    @cargo_type = []
    Cargo.all.each do |t|
      @cargo_type << [t.cargo_type, t.cargo_type]
    end
    @cargo_type = @cargo_type.uniq
  end

  def load_location
    @load_locations = []
    Cargo.all.each do |c|
      @load_locations << [c.load_location, c.load_location]
    end
    @load_locations = @load_locations.uniq
  end
end
