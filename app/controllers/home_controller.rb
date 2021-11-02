class HomeController < ApplicationController
  def index
    # @tips = Tip.order(updated_at: :desc).limit(4)
    @tips = Tip.most_recent
  end
end
