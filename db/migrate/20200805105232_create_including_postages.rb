class CreateIncludingPostages < ActiveRecord::Migration[6.0]
  def change
    create_table :including_postages do |t|

      t.timestamps
    end
  end
end
