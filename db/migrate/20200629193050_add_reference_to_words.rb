class AddReferenceToWords < ActiveRecord::Migration[6.0]
  def change
    add_reference :words, :language, index: true, foreign_key: true
  end
end
