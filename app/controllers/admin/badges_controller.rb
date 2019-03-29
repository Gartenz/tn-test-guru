class Admin::BadgesController < Admin::BaseController

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def update
    @badge = Badge.find(params[:id])
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :description, :image, :single, :badge_rule_id, :rule_value)
  end
end
