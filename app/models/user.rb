class User
  include Mongoid::Document
  include Mongoid::Paperclip
  include UserDevise # See this concern file for devise related fields

  has_mongoid_attached_file :profile_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :profile_image, content_type: /\Aimage\/.*\Z/, allow_blank: :true

  has_mongoid_attached_file :hover_profile_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :hover_profile_image, content_type: /\Aimage\/.*\Z/, allow_blank: :true


  STRING_FIELDS = %i( first_name
      last_name
      biography
      address_line_1
      address_line_2
      postal_code
      state_province
      country
      primary_phone )

  STRING_FIELDS.each do |string_field|
    field string_field
  end


  validates :password, :password_confirmation, presence: true, on: :create
  validates :password, :password_confirmation, presence: true, on: :update, allow_blank: :true
  validates :first_name, :last_name, presence: true
  validates :email, presence: true

  # Hack for latest mongoid to work with Devise
  class << self
    def serialize_from_session(key, salt)
      record = to_adapter.get(key[0]["$oid"])
      record if record && record.authenticatable_salt == salt
    end

    # Hack for activeadmin
    def primary_key
      'id'
    end
  end
end
