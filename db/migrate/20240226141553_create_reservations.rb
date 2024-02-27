# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true, index: false
      t.references :book, null: false, foreign_key: true, index: false
      t.date :returned_on

      t.timestamps
    end
  end
end
