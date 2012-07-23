# encoding: UTF-8
class Attachment
  include Mongoid::Document
  include Mongoid::AutoIncrement
  field :file, type: String
  field :attachable_type, type: Integer
  field :description, type: String
  belongs_to :attachable, :polymorphic => true
  mount_uploader :file, FileUploader

end
