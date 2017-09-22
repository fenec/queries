class QueryFacade
  def queries
    {list: queries_list, count: queries_count}
  end

  def queries_list
    @queries_list ||= Query.order("created_at DESC")
  end

  def queries_count
    "#{queries_total} #{I18n.translate :queries_count, count: queries_total}"
  end

  private

  def queries_total
    Query.maximum(:id) || 0
  end
end
