# frozen_string_literal: true

require_relative "exchange_party/version"
require "open-uri"
require "nokogiri"
require "pry"
require "exchange_party/currency"

module ExchangeParty
  class Error < StandardError; end

  URL = "https://www.tcmb.gov.tr/kurlar"

  def self.currencies(date = nil)
    url = generate_url(date)
    doc = ""

    begin
      doc = Nokogiri.XML(::OpenURI.open_uri(url), nil, "UTF-8").remove_namespaces!
    rescue StandardError
      raise StandardError if doc.empty?
    else
      generate_currencies(doc)
    end
  end

  def self.generate_url(date)
    if date.nil?
      "#{URL}/today.xml"
    else
      year = date.split("-").first
      month = date.split("-")[1]
      day = date.split("-").last

      "#{URL}/#{year}#{month}/#{day}#{month}#{year}.xml"
    end
  end

  def self.generate_currencies(doc)
    currency_elements = doc.elements.first.elements
    attributes = doc.elements.first.attributes
    currency_attributes = attributes.transform_values(&:value)
    currencies = []

    currency_elements.each do |currency_element|
      currencies << ExchangeParty::Currency.new(currency_element, currency_attributes)
    end

    currencies
  end
end
