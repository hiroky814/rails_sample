module Api::V1
	class PdfUrlController < ActionController::API
    def read
      render json: { url: ''}.to_json
    end
	end
end
