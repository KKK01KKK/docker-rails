class HomeController < ApplicationController
  before_action :forbid_login_coach, {only: [:top]}
  def top
  end

  def about
  end
end
