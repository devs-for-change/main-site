class FunFacts
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :fun_fact_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  field :left_number
  field :right_number
  field :text

  validates_attachment_content_type :fun_fact_image, content_type: /\Aimage\/.*\Z/, allow_blank: :false

  class << self
    def primary_key
      'id'
    end
  end
end
