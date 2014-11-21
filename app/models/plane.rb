class Plane < ActiveRecord::Base
  belongs_to :src, class_name: "City"
  belongs_to :dst, class_name: "City"

  VALID_TIME_REGEX = /\A(?:[0-1]?[0-9]|2[10-23])\:[0-5][0-9]\z/
  
  default_scope -> {order('created_at DESC')}
  validates :planeno, presence: true
  validates :src_id, presence: true
  validates :dst_id, presence: true
  validates :time, presence: true, format: {with: VALID_TIME_REGEX}
  validates :price, presence: true
end
