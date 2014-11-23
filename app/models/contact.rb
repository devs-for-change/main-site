class Contact
  include Mongoid::Document
  include Mongoid::Timestamps

  INQUIRY_TYPES = ["Web services for my non-profit",
                   "Volunteering with Devs for Change",
                   "General Information"]

  field :inquiry_type
  field :name
  field :email
  field :company
  field :role
  field :website
  field :notes
end
