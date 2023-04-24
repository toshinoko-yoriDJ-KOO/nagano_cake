class Home < ApplicationRecord
  has_one_attached :image

def get_image(width, height)
  unless image.attached?
    return nil
  end
    image.variant(resize_to_limit: [width, height])
end
end
