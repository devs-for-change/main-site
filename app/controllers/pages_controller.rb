class PagesController < ApplicationController
  helper_method :title, :page

  private

  def title
    StaticPage[action_name][:title]
  end

  def page
    StaticPage.find(action_name)
  end

end
