class CreateEmpleados < ActiveRecord::Migration[8.0]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :email
      t.string :area
      t.date :fecha_ingreso
      t.string :estado

      t.timestamps
    end
  end
end
