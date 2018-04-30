class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.string :title
      t.datetime :meetDate
      t.boolean :isVirtual
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
