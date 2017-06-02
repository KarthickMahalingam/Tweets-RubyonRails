class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.column :author_id, :string
      t.column :title,     :text
      t.column :status,    :text
      t.timestamps
    end
  end
end
