module Api::V1
  class PdfUrlController < ActionController::API
    require 'aws-sdk'

    def read
      access_key = ENV['ACCESS_KEY']
      secret_key = ENV['SECRET_KEY']
      region = ENV['REGION']
      s3_bucket_name = ENV['BUCKET_NAME']
      s3_obeject_key = ENV['OBJECT_KEY']
      expire_time = ENV['EXPIRE_TIME'].to_i # seconds

      resource = Aws::S3::Resource.new(
        :region => region,
        :access_key_id => access_key,
        :secret_access_key => secret_key
        )
      object = resource.bucket(s3_bucket_name).object(s3_obeject_key)
      url = URI.parse(object.presigned_url(:get, expires_in: expire_time))

      puts url

      render json: { url: url }.to_json
    end
	end
end
