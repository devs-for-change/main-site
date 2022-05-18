class Contact < ActiveRecord::Base

  INQUIRY_TYPES = ["Services",
                   "Volunteering",
                   "General Info"]

  #field :inquiry_type
  #field :name
  #field :email
  #field :company
  #field :role
  #field :website
  #field :notes

  validates :inquiry_type, :name, :email, presence: true

  scope :recent, -> { order('created_at desc').limit(10) }
end
