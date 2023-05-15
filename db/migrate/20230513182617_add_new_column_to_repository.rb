# frozen_string_literal: true

class AddNewColumnToRepository < ActiveRecord::Migration[7.0]
  def change
    add_column :repositories, :name, :string
  end
end
