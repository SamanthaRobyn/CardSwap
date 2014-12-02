class Businesscard
  include Mongoid::Document
  include Mongoid::Paperclip

  field :first_name, type: String
  field :last_name, type: String
  field :company, type: String
  field :title, type: String
  field :street, type: String
  field :city, type: String
  field :state, type: String
  field :zip_code, type: Integer
  field :email, type: String
  field :work_phone, type: String
  field :cell_phone, type: String
  field :linkedin, type: String
  field :facebook, type: String
  field :twitter, type: String
  field :instagram, type: String
  field :website, type: String
  field :background, type: String
  belongs_to :user
  #has_many :user_businesscards
  has_mongoid_attached_file :background
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\Z/
end
