class CreateUserRemarksRemarks < ActiveRecord::Migration
  def change
    create_table :user_remarks_remarks do |t|
      t.string :title
      t.text :text
      t.integer :user_id
      t.string :user_type
      t.string :link

      t.timestamps null: false
    end
  end
end
