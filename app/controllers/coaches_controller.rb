class CoachesController < ApplicationController
  before_action :authenticate_coach, {only: [:edit, :update, :mypage]}
  before_action :forbid_login_coach, {only: [:new, :create, :login_form, :login]}

  def index
    @coaches = Coach.all
  end

  def show
    @coach = Coach.find_by(id: params[:id])
  end

  def new
    @coach = Coach.new
  end

  def create
    @coach = Coach.new(
      name: params[:name],
      email: params[:email],
      image_name: "default.png",
      password: params[:password]
    )
    if @coach.save
      session[:coach_id] = @coach.id
      flash[:notice] = "コーチ登録が完了しました"
      redirect_to("/coaches/index")
    else
      render("coaches/new", status: :unprocessable_entity)
    end
  end

  def edit
    @coach = Coach.find_by(id: params[:id])
  end

  def update
    @coach = Coach.find_by(id: params[:id])
    @coach.name = params[:name]
    @coach.email = params[:email]
    @coach.self_introduction = params[:self_introduction]
    @coach.qualification = params[:qualification]
    @coach.achievement = params[:achievement]
    @coach.opening_slot = params[:opening_slot]
    if params[:image]
      @coach.image_name = "#{@coach.id}.jpg"
      image = params[:image]
      File.binwrite("public/coach_images/#{@coach.image_name}", image.read)
    end
    if @coach.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/coaches/#{@coach.id}")
    else
      render("coaches/edit", status: :unprocessable_entity)
    end
  end

  def login_form
  end

  def login
    @coach = Coach.find_by(email: params[:email])
    if @coach && @coach.authenticate(params[:password])
      session[:coach_id] = @coach.id
      flash[:notice] = "ログインしました"
      redirect_to("/courses/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("coaches/login_form", status: :unprocessable_entity)
    end
  end

  def logout
    session[:coach_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/coaches/login")
  end

  def mypage
    @coach = Coach.find_by(id: params[:id])
  end
end