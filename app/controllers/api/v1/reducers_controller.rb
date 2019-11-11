class Api::V1::ReducersController < ApplicationController

  def index
    @result = ReducerService::ReducerFetcher.execute
  end

  def show
    @result = ReducerService::ReducerRetriever.execute(params[:token])
    redirect_to @result[:entity], :status => 301
  end

  def create
    @result = ReducerService::ReducerCreator.execute(permitted_params)
  end

  private

  def permitted_params
    params.require(:reducer).permit(:url)
  end

end