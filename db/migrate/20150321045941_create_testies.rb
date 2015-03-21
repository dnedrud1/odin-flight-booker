class CreateTesties < ActiveRecord::Migration
  def change
    create_table :testies do |t|
      t.string :testy

      t.timestamps
    end
  end
end
