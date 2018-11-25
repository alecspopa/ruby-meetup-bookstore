# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :no_pages
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :books, :discarded_at
  end
end
