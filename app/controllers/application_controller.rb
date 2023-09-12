class ApplicationController < ActionController::Base
    before_action :set_current_coach
    before_action :set_current_user
    before_action :ensure_correct_coach, {only: [:edit, :update]}

    def set_current_coach
        @current_coach = Coach.find_by(id: session[:coach_id])
    end

    def set_current_user
         @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate_coach
        if @current_coach == nil
            flash[:notice] = "ログインが必要です"
            redirect_to("/coaches/login")
        end
    end

    def forbid_login_coach
        if @current_coach
        flash[:notice] = "すでにログインしています"
        redirect_to("/courses/index")
        end
    end

    def ensure_correct_coach
        if @current_coach.id != params[:id].to_i
            flash[:notice] = "権限がありません"
            redirect_to("/courses/index")
        end
    end
end
