# frozen_string_literal: true

namespace :calibration_alert do
  desc 'calibration limit date alert'
  task alert: :environment do
    # ユーザを検索
    users = User.all.order(:id)
    # ユーザごとにチェック＆メール
    to_day = Time.zone.today
    judgment_line = to_day + 14
    users.each do |user|
      calibration_warnings = Vehicle.where(user_id: user.user_id)
                                    .where(['scheduled_calibration < ?', judgment_line])
                                    .where(['scheduled_calibration > ?', to_day]).order(:vehicle_id)
      calibration_dangers = Vehicle.where(user_id: user.user_id).where(['scheduled_calibration < ?', to_day]).order(:vehicle_id)
      # メール送信
      if calibration_warnings.present? || calibration_dangers.present?
        CalibrationNotificationMailer.send_notification(user, calibration_warnings, calibration_dangers).deliver_now
      end
    end
  end
end
