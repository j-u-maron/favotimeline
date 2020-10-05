class CreateRecommendeds < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendedrailss do |t|
      t.string :content
      t.string :tag
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
