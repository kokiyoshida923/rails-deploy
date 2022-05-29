class User < ApplicationRecord
  validates :name,  presence: true,
                    length: { maximum: 20, minimum: 6 }

  validates :email, presence: true,
                    length: { maximum: 255 }
end
