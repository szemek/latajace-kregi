module Orderable
  extend ActiveSupport::Concern

  module ClassMethods
    def where_with_order(params)
      raise "Could not parse params" unless params.size == 1

      key, values = params.first

      where(params).order(values.map{|value| "#{key}='#{value}' DESC"}.join(', '))
    end
  end
end
