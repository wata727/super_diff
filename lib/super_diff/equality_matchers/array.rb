module SuperDiff
  module EqualityMatchers
    class Array < Base
      def self.applies_to?(value)
        value.class == ::Array
      end

      def fail
        <<~OUTPUT.strip
          Differing arrays.

          #{
            Helpers.style(
              :expected,
              "Expected: " +
              SuperDiff.inspect_object(expected, as_single_line: true),
            )
          }
          #{
            Helpers.style(
              :actual,
              "  Actual: " +
              SuperDiff.inspect_object(actual, as_single_line: true),
            )
          }

          Diff:

          #{diff}
        OUTPUT
      end

      protected

      def diff
        Differs::Array.call(expected, actual, indent_level: 0)
      end
    end
  end
end
