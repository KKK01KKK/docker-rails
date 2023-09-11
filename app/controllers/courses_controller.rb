class CoursesController < ApplicationController
  def index
    @courses = Course.all.order(created_at: :desc)
  end

  def show
    @course = Course.find_by(id: params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(name: params[:name])
    if @course.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/courses/index")
    else
      render("courses/new", status: :unprocessable_entity)
    end
  end

  def edit
    @course = Course.find_by(id: params[:id])
  end

  def update
    @course = Course.find_by(id: params[:id])
    @course.name = params[:name]
    if @course.save
      flash[:notice] = "コースを編集しました"
      redirect_to("/courses/index")
    else
      render("courses/edit", status: :unprocessable_entity)
    end
  end

  def destroy
    @course = Course.find_by(id: params[:id])
    @course.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/courses/index")
  end
end
