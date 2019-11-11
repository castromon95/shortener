class Api::V1::HelpersController < ApplicationController

  def robot
    @result = HelperService::UrlFetcher.execute
  end

  def catch_404
    raise ActionController::RoutingError, params[:path]
  end
end
