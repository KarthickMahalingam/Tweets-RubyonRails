class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.column  :author_id,   :string
      t.column  :post_id,     :string
      t.column  :comment,     :text
      t.timestamps
    end
  end
end
