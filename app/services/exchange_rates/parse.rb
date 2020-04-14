# frozen_string_literal: true

require 'open-uri'

module ExchangeRates
  class Parse
    URL = 'https://www.cbr.ru/'
    
    def initialize
      @doc = Nokogiri::HTML(open(URL))
    end

    def call
      doc
        .search('.indicator_course_cur_dollar')
        .first.parent.parent.parent
        .search('.indicator_el_value')
        .last.text.gsub(',', '.').to_f
    end

    private

    attr_reader :doc
  end
end
