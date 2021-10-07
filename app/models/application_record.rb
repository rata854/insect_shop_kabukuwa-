class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 消費税計算
  def tax_included_price
    (self.price * 1.1).floor(0)
  end

end
