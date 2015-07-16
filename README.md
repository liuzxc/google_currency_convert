# Google currency convert
currency convert by google finance [API](https://www.google.com/finance/converter)

### Install

```
gem install google_currency_convert
```

### Get currency code and country info

```
GoogleCurrencyConvert.currency_info

=> ["AED United Arab Emirates Dirham (AED)", "AFN Afghan Afghani (AFN)", "ALL Albanian Lek (ALL)", "AMD Armenian Dram (AMD)", "ANG Netherlands Antillean Guilder (ANG)", "AOA Angolan Kwanza (AOA)", "ARS Argentine Peso (ARS)", "AUD Australian Dollar (A$)", "AWG Aruban Florin (AWG)", "AZN Azerbaijani Manat (AZN)", "BAM Bosnia-Herzegovina Convertible Mark (BAM)", "BBD Barbadian Dollar (BBD)", "BDT Bangladeshi Taka (BDT)",....]

```
You can get the currency code by country name. For example:

```
GoogleCurrencyConvert.currency_info.select { |i| i.include?("Jap")}

=> ["JPY Japanese Yen (¥)"]
```
### Only get currency codes

```
GoogleCurrencyConvert.currency_codes

=> ["AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN", "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BRL", "BSD", "BTC", "BTN", "BWP", "BYR", "BZD", "CAD", "CDF", "CHF", "CLF", "CLP", "CNH", "CNY", "COP", "CRC", "CUP", "CVE", "CZK", "DEM", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN", "ETB", "EUR", "FIM", "FJD", "FKP", "FRF", "GBP", "GEL", "GHS", "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "IEP", "ILS", "INR", "IQD", "IRR", "ISK", "ITL", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KMF", "KPW", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LTL", "LVL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRO", "MUR", "MVR", "MWK", "MXN", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PKG", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLL", "SOS", "SRD", "STD", "SVC", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VEF", "VND", "VUV", "WST", "XAF", "XCD", "XDR", "XOF", "XPF", "YER", "ZAR", "ZMK", "ZMW", "ZWL"]
```

### Currency convert

The amount parameter has the default value, so if don't pass the amount, you will get the
currency rate.

```
GoogleCurrencyConvert.currency_convert(from_currency, to_currency, amount = 1)
```

Convert US Dollar to Chinese Yuan, for example:

```
GoogleCurrencyConvert.currency_convert("USD", "CNY")
=> 6.2092
```

### Run Test

```
Rspec test --format d

GoogleCurrencyConvert
  currency info is a non-empty array
  currency codes a non-empty array
  return error if the currency code is invalid
  return error if the currency amount is not a positive integer
  get a float if the code and maount are right

Finished in 3.1 seconds (files took 0.32152 seconds to load)
5 examples, 0 failures
```