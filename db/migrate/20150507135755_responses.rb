class Responses < ActiveRecord::Migration
  def change
    create_table :responses do |table|
      table.integer :question_id
      table.integer :choice_id
      table.integer :survey_id
      table.integer :user_id
      table.string :text
    end
  end
end
