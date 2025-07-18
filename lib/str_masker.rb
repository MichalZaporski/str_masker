# frozen_string_literal: true

require_relative 'str_masker/version'

# A StrMasker gem main module.
module StrMasker
  class << self
    # Mask a portion of a string with asterisks (*) or your selected char between the specified positions.
    #
    # @param val: The string to mask
    # @param from: Starting position for masking (inclusive, default: 0)
    # @param to: Ending position for masking (must be negative, default: -1)
    # @param char [String] The character to use for masking (default: '*')
    # @return The masked string or nil if input is nil
    #
    # Example:
    #
    #   Mask middle characters
    #     mask_string("password", from: 1, to: -2) #=> "p******d"
    #
    #   Mask from start
    #     mask_string("secret", from: 0, to: -2) #=> "*****t"
    #
    #   Default usage:
    #     mask_string("secret") #=> "******"
    #
    # : (String?, ?from: Integer, ?to: Integer) -> String?
    def mask_string(val, from: 0, to: -1, char: '*')
      raise ArgumentError, '"from" must be a non-negative int' unless from.is_a?(Integer) && from >= 0
      raise ArgumentError, '"to" must be a negative int' unless to.is_a?(Integer) && to < 0
      raise ArgumentError, '"char" must be a single character string' unless char.is_a?(String) && char.length == 1

      return unless val

      len = val.length
      masked_chars_len = len - from + to + 1
      return val if masked_chars_len <= 0

      prefix = from.zero? ? '' : val[..(from - 1)]
      suffix = to == -1 ? '' : val[(to + 1)..]
      filling = char * masked_chars_len
      "#{prefix}#{filling}#{suffix}"
    end
  end
end
