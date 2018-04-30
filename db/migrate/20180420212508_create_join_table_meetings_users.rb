class CreateJoinTableMeetingsUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :meetings, :users do |t|
      t.references :meeting, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
