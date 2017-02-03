require 'oauth2/response'

# NOTE: The future (post DSTU-2) will be `application/fhir+xml`, the `xml+fhir` is deprecated but still used
OAuth2::Response.register_parser(:xml, ['application/fhir+xml', 'application/xml+fhir']) do |body|
  MultiXml.parse(body) rescue body
end

# NOTE: The future (post DSTU-2) will be `application/fhir+json`, the `json+fhir` is deprecated but still used
OAuth2::Response.register_parser(:json, ['application/fhir+json', 'application/json+fhir']) do |body|
  MultiJson.load(body) rescue body # rubocop:disable RescueModifier
end
