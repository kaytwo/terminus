# frozen_string_literal: true

require "dry/monads"
require "initable"

module Terminus
  module Aspects
    module Firmware
      module Headers
        module Transformers
          # Normalizes a MAC address to uppercase.
          class MACAddress
            include Initable[key: :HTTP_ID]
            include Dry::Monads[:result]

            def call headers
              value = headers[key]

              headers[key] = value.upcase if value.is_a?(String)

              Success headers
            end
          end
        end
      end
    end
  end
end
