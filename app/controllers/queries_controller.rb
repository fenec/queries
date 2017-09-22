class QueriesController < ApplicationController
  def index
    @query = Query.new
    @query_facade = QueryFacade.new.queries
  end

  def create
    query = Query.new(query_params)
    execution_time = Benchmark.ms { query.save! }
    query.update_attributes(execution_time: execution_time)
    render json: {new_query: query, queries_count: QueryFacade.new.queries_count}
  end

  private

  def query_params
    params.permit(:query)
  end
end
