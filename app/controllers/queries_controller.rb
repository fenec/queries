class QueriesController < ApplicationController
  def index
    @query = Query.new
    @query_facade = QueryFacade.new.queries
  end

  def create
    query = QueryCreator.new(query_params).call
    queries_count = QueryFacade.new.queries_count
    render json: {new_query: query, queries_count: queries_count}
  end

  private

  def query_params
    params.permit(:query)
  end
end
