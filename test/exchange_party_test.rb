# frozen_string_literal: true

require "test_helper"

class ExchangePartyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil(::ExchangeParty::VERSION)
  end

  def test_today_rates
    VCR.use_cassette("today") do
      expected_values = {
        code: "USD",
        name: "ABD DOLARI",
        currency_name: "US DOLLAR",
        forex_buying: "13.5378",
        forex_selling: "13.5622",
        bank_note_buying: "13.5284",
        bank_note_selling: "13.5826",
        rate_announcement_date: "14.02.2022"
      }
      currency_fields(expected_values)
    end
  end

  def test_exact_date_rates
    VCR.use_cassette("exact_date") do
      expected_values = {
        code: "USD",
        name: "ABD DOLARI",
        currency_name: "US DOLLAR",
        forex_buying: "13.5675",
        forex_selling: "13.5919",
        bank_note_buying: "13.5580",
        bank_note_selling: "13.6123",
        rate_announcement_date: "09.02.2022"
      }
      currency_fields(expected_values, "2022-02-09")
    end
  end

  def test_raise_error
    VCR.use_cassette("error") do
      assert_raises(StandardError) do
        ExchangeParty.currencies("202202-09")
      end
    end
  end

  private

  def currency_fields(expected_values, date = nil)
    currency = ExchangeParty.currencies(date).first

    assert_equal(expected_values[:code], currency.code)
    assert_equal(expected_values[:name], currency.name)
    assert_equal(expected_values[:currency_name], currency.curreny_name)
    assert_equal(expected_values[:forex_buying], currency.forex_buying)
    assert_equal(expected_values[:forex_selling], currency.forex_selling)
    assert_equal(expected_values[:bank_note_buying], currency.bank_note_buying)
    assert_equal(expected_values[:bank_note_selling], currency.bank_note_selling)
    assert_equal(expected_values[:rate_announcement_date], currency.rate_announcement_date)
  end
end
