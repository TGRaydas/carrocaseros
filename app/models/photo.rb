class Photo < ApplicationRecord
  has_attached_file :avatar, styles: {galery: "800x600#", high: "600x600#", medium: "300x300#", thumb: "200x120#", logo:"70x50#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/x
end
