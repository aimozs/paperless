class SearchController < ApplicationController
  def index
  end

  def query
    # Get the search terms from the q parameter and do a search
    # as we seen in the previous part of the article.
    if params[:q]
	    @search = Exercise.search do
	      fulltext params[:q] # Full text search
	    end
    	respond_to do |format|	
        # Create an array from the search results.
        @results = @search.results.map do |exercise|
          # Each element will be a hash containing only the title of the article.
          # The title key is used by typeahead.js.
          { name: exercise.name }
        end
        format.html { render 'search' } ## Specify the format in which you are rendering "new" page
        format.json { render json: @results }
      end
    end
  end
end
