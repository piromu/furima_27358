class CreateReadyTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :ready_times do |t|

      t.timestamps
    end
  end
end
