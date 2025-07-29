class Empleado < ApplicationRecord
 m validates :nombre, :email, :area, :fecha_ingreso, :estado, presence: true
  validates :eail, format: { with: URI::MailTo::EMAIL_REGEXP }
end