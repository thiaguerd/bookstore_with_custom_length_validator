module ActiveModel
  module Validations
    class LengthValidator < EachValidator
      Kernel::silence_warnings do
        MESSAGES  = { is: :wrong_length, minimum: :too_short, maximum: :too_long, included: :wrong_length }.freeze
        CHECKS    = { is: :==, minimum: :>=, maximum: :<=, included: :included? }.freeze
      end

      def check_validity!
        keys = CHECKS.keys & options.keys

        if keys.empty?
          raise ArgumentError, "Range unspecified. Specify the :in, :within, :maximum, :minimum, or :is option."
        end

        keys.each do |key|
          value = options[key]
          if key == :included
            raise ArgumentError, ":#{key} must be a array" unless value.is_a?(Array)
          else
            unless (value.is_a?(Integer) && value >= 0) || value == Float::INFINITY || value.is_a?(Symbol) || value.is_a?(Proc)
              raise ArgumentError, ":#{key} must be a non-negative Integer, Infinity, Symbol, or Proc"
            end
          end
        end
      end
    end
  end
end
