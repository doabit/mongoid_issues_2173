# encoding: UTF-8
class Photo
  include Mongoid::Document
  include Mongoid::AutoIncrement
  field :title, type: String
  field :description, type: String
  has_many :attachments, :as => :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments , :allow_destroy => true, :reject_if => lambda { |a| a[:file].blank? }
end
