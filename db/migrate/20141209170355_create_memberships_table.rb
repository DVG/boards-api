class CreateMembershipsTable < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :project
      t.belongs_to :user
      t.boolean :admin
    end

    add_index :memberships, :project_id
    add_index :memberships, :user_id
    add_index :memberships, [:project_id, :user_id]
  end
end
