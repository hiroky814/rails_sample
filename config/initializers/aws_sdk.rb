# frozen_string_literal: true

aws_access_id = ENV.fetch('ACCESS_KEY_ID') { '' }
aws_secret_key = ENV.fetch('SECRET_ACCESS_KEY') { '' }

creds = Aws::Credentials.new(aws_access_id, aws_secret_key)
Aws::Rails.add_action_mailer_delivery_method(:aws_sdk, credentials: creds, region: ENV['SES_REGION'])
