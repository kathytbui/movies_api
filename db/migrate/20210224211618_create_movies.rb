class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :imbd_id
      t.string :title
      t.string :overview
      t.string :production_companies
      t.string :release_date
      t.integer :budget
      t.integer :revenue
      t.integer :runtime
      t.string :language
      t.string :genres
      t.string :status

      t.timestamps
    end
  end
end
