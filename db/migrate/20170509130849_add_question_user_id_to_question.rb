class AddQuestionUserIdToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :question_user_id, :Integer
  end
end
