class Task < ApplicationRecord
    validates :title, presence: true ,length: {maximum: 20}
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :memo, length: {maximum: 500}
    validate :expiration_date_cannot_be_in_the_past
 

  def expiration_date_cannot_be_in_the_past
    if start_date>end_date
      errors.add(:end_date, "過去の日付は使えません")
    end
  end

end
