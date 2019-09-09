class SearchFacade
  include ActionView::Helpers::TextHelper

  def initialize(query)
    @query = query
  end

  def result_count
    pluralize(results.count, 'Result')
  end

  def results
    Item.where("name ~* ?", @query)
  end
end
