class CreateApplicationModels < ActiveRecord::Migration
  def change
    create_table :application_models do |t|
      t.string :model

      t.timestamps
    end
  end
end
