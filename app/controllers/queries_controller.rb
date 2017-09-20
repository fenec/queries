class QueriesController < ApplicationController
  def index
    @query = Query.new
    @queries_count = Query.maximum(:id) || 0
    @queries_list = Query.all
  end

  def create
    query = Query.new(query_params)
    execution_time = Benchmark.ms { query.save! }
    query.update_attributes(execution_time: execution_time)
  end

  private

  def query_params
    params.require(:query).permit(:query)
  end
end
