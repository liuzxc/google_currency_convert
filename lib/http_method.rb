require 'net/http'

module HttpMethod

	def https_get(url, params)
		uri = URI(url)
		uri.query = URI.encode_www_form(params)
		http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
	end

end