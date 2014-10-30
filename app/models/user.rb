class User
  include Mongoid::Document
  include Mongoid::Paperclip
  include UserDevise # See this concern file for devise related fields
  has_mongoid_attached_file :profile_image

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
