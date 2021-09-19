# frozen_string_literal: true

namespace :cancel_entry do
  desc 'calibration limit date alert'
  task cancel: :environment do
    # 入庫情報を検索
    entries = Entry.where(status: 3)
    entries.each do |entry|
      # 入庫に必要な情報が入力済かチェック
      if check_target_date(entry) && check_not_enterd(entry)
        # 入庫情報削除
        entry.destroy
      end
    end
  end

  private

  def check_target_date(entry)
    result = false
    two_days_later = Date.today.next_day(2)
    if entry.entry_date = two_days_later
      result = true
    end
    result
  end
end