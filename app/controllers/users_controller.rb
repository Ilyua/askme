class UsersController < ApplicationController
  before_action :load_user, except: [:index, :create, :new]
  before_action :authorize,except: [:index, :new, :create,:show]

  def index
    @users = User.all
  end

  def new
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new
  end

  def edit

  end

  def update
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?

    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Успешно отредактировано'
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'Успешно зарегистрирован'

    else
      render 'new'
    end
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @new_question = @user.questions.build
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
