class StaticPage
  include ActiveModel::Model

  PAGES = [
     { title: 'Home', slug: 'index' },
     { title: 'About', slug: 'about' },
     { title: 'Meet the team', slug: 'meet_the_team' },
     { title: 'Blog', slug: 'blog', sub_nav_pages: ['volunteer', 'contact', 'donate'] },
     { title: 'Work', slug: 'work', sub_nav_pages: ['volunteer', 'contact', 'donate'] },
     { title: 'Donate', slug: 'donate' },
     { title: 'Contact', slug: 'contact' },
     { title: 'Sponsor', slug: 'sponsor' },
     { title: 'Financial Info', slug: 'financial_info' },
     { title: 'Volunteer', slug: 'volunteer', hide_main_nav: true },
  ]

  attr_accessor :title, :slug, :hide_main_nav
  attr_writer :sub_nav_pages

  alias_attribute :name, :title

  def hide_main_nav?
    !! hide_main_nav
  end

  def has_sub_nav_pages?
    @sub_nav_pages.respond_to?(:[])
  end

  def sub_nav_pages
    return unless has_sub_nav_pages?
    @sub_nav_pages.map do |page|
      self.class.find page
    end
  end

  class << self
    def all
      @all ||= begin
        PAGES.map do |page|
          new(page)
        end
      end
    end

    def [](slug)
      PAGES.find { |p| p[:slug] == slug.to_s }
    end

    def find(slug)
      all.find { |p| p.slug == slug }
    end

    def titles
      PAGES.map { |p| p[:title] }
    end

    def slugs
      PAGES.map { |p| p[:slug] }
    end
  end

end
