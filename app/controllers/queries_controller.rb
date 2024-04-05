class QueriesController < ApplicationController

  def create
    @query = params[:query]
    begin
      @results = ActiveRecord::Base.connection.execute(@query)
      @cols = @results.any? && @results.first.keys
    rescue ActiveRecord::StatementInvalid => e
      @results = e.message
    end
  end

end
