class UsersController < ApplicationController
  before_action :load_user, except: [:index, :create, :new]
  before_action :authorize, except: [:index, :new, :create, :show]

  def index
    @users = User.all
  end

  def new
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new
  end

  def edit

  end

  def destroy
    if @user.destroy
      redirect_to root_url, notice: 'вы успешно удалили'
    else
      redirect_to user_path(@user)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Успешно отредактировано'
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
        if @user.present?
        session[:user_id] = @user.id
        redirect_to root_url, notice: 'Вы успешно зарегались'
      else
        render 'new', notice: 'Какая-то ошибка'
      end
    else
      render 'new'
    end
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @new_question = @user.questions.build
    @questions_count = @questions.count
    @answers_count = @questions.where.not(answer: nil).count
    @unanswered_count = @questions_count - @answers_count
  end

  private

  def authorize
    reject_user unless @user == current_user
  end

  def load_user
    @user ||= User.find params[:id]
  end

  def user_params
    params.require(:user).permit(
        :email, :password, :password_confirmation,
        :name, :username, :avatar_url)
  end
end
