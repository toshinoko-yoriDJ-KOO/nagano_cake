class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum making_status: {
    waiting: 0,    # 製作待ち
    producing: 1,  # 製作中
    completed: 2,  # 製作完了
    cancelled: 3   # 製作キャンセル
  }
end
