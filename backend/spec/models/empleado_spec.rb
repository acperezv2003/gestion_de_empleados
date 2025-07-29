require 'rails_helper'

RSpec.describe Empleado, type: :model do
  it 'es válido con atributos válidos' do
    empleado = Empleado.new(
      nombre: 'Juan',
      email: 'juan@mail.com',
      area: 'IT',
      fecha_ingreso: Date.today,
      estado: 'Activo'
    )
    expect(empleado).to be_valid
  end

  it 'es inválido sin nombre' do
    empleado = Empleado.new(nombre: nil)
    empleado.validate
    expect(empleado.errors[:nombre]).to include("can't be blank")
  end
end
