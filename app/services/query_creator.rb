class QueryCreator
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    query = Query.new(params)
    execution_time = Benchmark.ms { query.save! }
    query.update_attributes(execution_time: execution_time)
    query
  end
end
