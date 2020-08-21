class AddMeetingDurationToTutorials < ActiveRecord::Migration[6.0]
  def change
    add_column :tutorials, :meeting_duration, :integer, default: 60, null: false
  end
end
