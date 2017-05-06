class UsersController < ApplicationController
  def index
    @users = [
        User.new(
            id: 1,
            name: 'One',
            username: 'One',
            avatar_url: 'photo'
        )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
        name: 'Ilya',
        username: 'Finnegan',
        avatar_url: ''
    )

    @questions = [
        Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016')),
        Question.new(text: 'Что делаешь?', created_at: Date.parse('29.03.2017'))
    ]

    @new_question = Question.new
  end
end
