module Api::V1
	class PdfUrlController < ActionController::API
    def read
      render json: { url: 'https://s3-ap-northeast-1.amazonaws.com/pdf-test-hiroky/sample.pdf'}.to_json
    end
	end
end
