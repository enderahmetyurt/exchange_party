# frozen_string_literal: true

module ExchangeParty
  class Currency
    attr_reader :name, :code, :curreny_name, :forex_buying, :forex_selling, :bank_note_buying, :bank_note_selling,
                :rate_announcement_date

    def initialize(currency_element, attributes)
      @name = children_value(currency_element, 3)
      @code = currency_element.attributes["Kod"].value
      @curreny_name = children_value(currency_element, 5)
      @forex_buying = children_value(currency_element, 7)
      @forex_selling = children_value(currency_element, 9)
      @bank_note_buying = children_value(currency_element, 11)
      @bank_note_selling = children_value(currency_element, 13)
      @rate_announcement_date = attributes["Tarih"]
    end

    private

    def children_value(currency_element, index)
      currency_element.children[index].children.text
    end
  end
end
