# frozen_string_literal: true

namespace :entry_not_enterd_alert do
  desc 'Entry information not enterd alert'
  task alert: :environment do
    # 入庫情報を検索
    entries = Entry.where(status: 3)
    entries.each do |entry|
      # 入庫に必要な情報が入力済かチェック
      if check_target_date(entry) && check_not_enterd(entry)
        # メール送信
        user = User.where(user_id: entry.user_id)[0]
        EntryNotEnterdNotificationMailer.send_notification(user).deliver_now
      end
    end
  end

  private

  def check_target_date(entry)
    result = false
    two_days_later = Date.today.next_day(2)
    three_days_later = Date.today.next_day(3)
    if entry.entry_date = two_days_later || entry.entry_date = three_days_later
      result = true
    end
    result
  end
end

def check_not_enterd(entry)
  result = false
  if entry.entry_time.blank? || entry.entry_form.blank? || entry.entry_method.blank? || entry.company_name.blank? || entry.name.blank? || entry.contact_information.blank? || entry.vehicle_number.blank?
    result = true
  end
  if entry.entry_method == 2 && (entry.company_name_ruby.blank? || entry.name_ruby.blank?)
    result = true
  end
  result
end
