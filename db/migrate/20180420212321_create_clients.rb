class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :legal_number
      t.string :web_page
      t.string :address
      t.string :phone_number
      t.string :sector

      t.timestamps
    end
  end
end
