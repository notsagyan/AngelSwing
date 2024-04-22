class CreateContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :body
      t.string :text

      t.timestamps
    end
  end
end
