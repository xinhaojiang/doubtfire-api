class AddMeetingDurationToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :meeting_duration, :integer, default: 60, null: false
  end
end
