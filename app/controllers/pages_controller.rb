class PagesController < ApplicationController
  helper_method :title

  private

  def title
    StaticPage[action_name][:title]
  end

end
