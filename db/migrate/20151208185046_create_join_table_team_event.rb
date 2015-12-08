class CreateJoinTableTeamEvent < ActiveRecord::Migration
  def change
    create_join_table :Teams, :Events do |t|
      # t.index [:team_id, :event_id]
      # t.index [:event_id, :team_id]
    end
  end
end
