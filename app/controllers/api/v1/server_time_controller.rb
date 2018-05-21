module Api::V1
		class ServerTimeController < ActionController::API
			require 'date'

			def read
				# 現在時刻取得
				now_time = Time.now
				now_time_str = now_time.strftime("%Y/%m/%d %H:%M:%S")
				# 時刻返却
				render json: {
					time: now_time_str
				}.to_json
			end
    end
end