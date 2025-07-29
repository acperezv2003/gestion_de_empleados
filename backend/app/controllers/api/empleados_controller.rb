module Api
  class EmpleadosController < ApplicationController
    before_action :set_empleado, only: [:show, :update, :destroy]

    def index
      empleados = Empleado.all
      empleados = empleados.where("nombre LIKE ?", "%#{params[:nombre]}%") if params[:nombre]
      empleados = empleados.where(area: params[:area]) if params[:area]
      render json: empleados
    end

    def show
      render json: @empleado
    end

    def create
      empleado = Empleado.new(empleado_params)
      if empleado.save
        render json: empleado, status: :created
      else
        render json: { errors: empleado.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @empleado.update(empleado_params)
        render json: @empleado
      else
        render json: { errors: @empleado.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @empleado.destroy
      head :no_content
    end

    private

    def set_empleado
      @empleado = Empleado.find(params[:id])
    end

    def empleado_params
      params.require(:empleado).permit(:nombre, :email, :area, :fecha_ingreso, :estado)
    end
  end
end
