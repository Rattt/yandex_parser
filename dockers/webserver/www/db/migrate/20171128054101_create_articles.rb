# frozen_string_literal: true

# This is create table article
class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.timestamp :expired_at
      t.timestamps
    end
  end
end
