class AddPhotographyToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :photography, foreign_key: true
  end
end
