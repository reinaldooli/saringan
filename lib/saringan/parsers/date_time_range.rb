module Saringan
  module Parsers
    class DateTimeRange < Range
      MATCHER = /^dt\[(.+)\]$/
      FORMAT = '%Y-%m-%d %H:%M:%S'

      class << self
        def split(value)
          splitted = super(value)
          splitted.map{|part| DateTime.strptime(part, FORMAT)}
        end

        def clean(value)
          value.gsub(/^dt\[/, '').gsub(/\]$/, '')
        end
      end
    end
  end
end
