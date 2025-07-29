class Empleado < ApplicationRecord
  validates :nombre, :email, :area, :fecha_ingreso, :estado, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end