class CargosController < ApplicationController
  def index
    @cargos = Cargo.all
  end

  def new
    @cargo = Cargo.new
  end

  def create
    @cargo = Cargo.find(cargo_params)
    if @cargo.save!
      redirect_to cargos_index_path(@cargo)
    else
      render :new
    end
  end

  private

  def cargo_params
    params.require(:cargo)
          .permit(:cargo_name, :volume, :load_location, :discharge_location,
                  :cargo_load_window, :gas_free, :cargo_type)
  end
end
