module ApplicationHelper
  def static_pages
    StaticPage.all
  end

  def sub_nav_for_current_page?
    page.has_sub_nav_pages?
  end

  def sub_nav_links
    sub_nav_pages_for_current_page.map do |page|
      link_to page.title, send("#{page.slug}_path")
    end
  end

  def sub_nav_pages_for_current_page
    page.sub_nav_pages
  end

  def users
    User.all
  end

  def fun_facts
    FunFacts.all
  end

  def nav_class_for(nav_page)
    page == nav_page ? 'active' : ''
  end
end
