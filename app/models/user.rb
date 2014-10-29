class User
  include Mongoid::Document
  include Mongoid::Paperclip
  include UserDevise # See this concern file for devise related fields
  has_mongoid_attached_file :profile_image

  %i( first_name
      last_name
      biography
      address_line_1
      address_line_2
      postal_code
      state_province
      country
      primary_phone ).each do |string_field|
    field string_field
  end

  validates :first_name, :last_name, :email, presence: true

  # Hack for latest mongoid to work with Devise
  class << self
    def serialize_from_session(key, salt)
      record = to_adapter.get(key[0]["$oid"])
      record if record && record.authenticatable_salt == salt
    end

    # Hack for activeadmin column names
    def column_names
      fields.map { |field| field.first }
    end
  end




end
