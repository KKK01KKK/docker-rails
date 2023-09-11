class CoachesController < ApplicationController
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
      email: params[:email]
    )
    if @coach.save
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
    if @coach.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/coaches/#{@coach.id}")
    else
      render("coaches/edit", status: :unprocessable_entity)
    end
  end
end
