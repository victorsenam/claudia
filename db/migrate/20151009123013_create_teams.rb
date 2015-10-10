class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|

      t.timestamps null: false
    end

    create_table :team_members do |t| 
    	t.belongs_to :user, index: true
    	t.belongs_to :team , index: true
    	t.timestamps null:false

    end
  end
end
