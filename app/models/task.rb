class Task < ApplicationRecord
    validates :title, presence: true ,length: {maximum: 20}
    
    validates :memo, length: {maximum: 500}
   
    validates :end_date_after_start_date, presence: true

    def end_date_after_start_date #メソッド名変更
      return if end_date.blank? || start_date.blank?
      if end_date < start_date
        errors.add(:end_date, "は開始日以降の日付を選択してください")
      end
  end
end
