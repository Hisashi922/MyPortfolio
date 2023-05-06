class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
