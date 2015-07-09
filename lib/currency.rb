require 'net/http'
require 'nokogiri'

class Currency

	def self.currency_info
		unless @info
			@info = []
			file_path = File.expand_path("curr_code.csv", File.dirname(__FILE__))
			IO.readlines(file_path).each { |line| @info << line.strip }
	    end
	    @info
	end

	def self.currency_codes
		@info ||= currency_info
		@info.map { |i| i.split(' ')[0] }
	end

	def self.currency_convert(from, to, amount)
		if not currency_codes.include?(from) or not currency_codes.include?(to)
			return "Error: cannot support such currency code"
		end

		return "Error: amount must be a positive integer" if amount <= 0 or amount.class != Fixnum

	    host = "www.google.com"
	    http = Net::HTTP.new(host, 80)
	    url = "/finance/converter?a=#{amount}&from=#{from}&to=#{to}"
	    response = http.get(url)

	    doc = Nokogiri::HTML(response.body)
	    result = doc.css('div#currency_converter_result').first.text
	    result.split(' ')[3].to_f
	end

end