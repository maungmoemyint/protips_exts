module Account

  class TipsController < ApplicationController
    def index
      user = User.find(session[:user_id])
      @tips = user.tips.order(updated_at: :desc)
  
    end
  end
end
