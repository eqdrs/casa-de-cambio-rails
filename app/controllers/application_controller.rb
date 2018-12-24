class ApplicationController < ActionController::Base
  rescue_from ActionController::RoutingError do |exception|
    logger.error 'Routing error occurred'
    render_404
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    logger.error 'Record not found'
    render_404
  end

  private 

  def render_404
    render :file => "#{Rails.root}/public/404"
  end
end
