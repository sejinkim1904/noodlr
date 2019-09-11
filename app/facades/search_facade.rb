class SearchFacade
  include ActionView::Helpers::TextHelper

  def initialize(query)
    @query = query
  end

  def result_count
    pluralize(results.count, 'Result')
  end

  def results
    Item.search @query, fields: [:name], match: :word_start
  end
end
