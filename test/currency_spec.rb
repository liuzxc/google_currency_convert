require_relative '../lib/currency.rb'

RSpec.describe Currency do
	it "currency info is a non-empty array" do
		expect(Currency.currency_info.size).to be > 0
	end

	it "currency codes a non-empty array" do
		expect(Currency.currency_codes.size).to be > 0
	end

	it "return error if the currency code is invalid" do
		err_message = "Error: cannot support such currency code"
		expect(Currency.currency_convert("ABCD", "AED", 1)).to eq(err_message)
		expect(Currency.currency_convert("AED", "ABCD", 1)).to eq(err_message)
	end

	it "return error if the currency amount is not a positive integer" do
		err_message = "Error: amount must be a positive integer"
		expect(Currency.currency_convert("AFN", "AED", 0)).to eq(err_message)
		expect(Currency.currency_convert("AFN", "AED", -1)).to eq(err_message)
	end

	it "get a float if the code and maount are right" do
		expect(Currency.currency_convert("AFN", "AED", 1)).to be > 0.0
	end

end
