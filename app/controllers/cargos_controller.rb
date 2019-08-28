class CargosController < ApplicationController
  def index
    @cargos = Cargo.all
  end

  def new
    @cargo = Cargo.new
    @cargos = Cargo.where oil_company_id: current_user.oil_company.id
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
          .permit(:cargo_name, :volume, :load_location, :discharge_location,
                  :cargo_load_window, :gas_free, :cargo_type)
  end
end

