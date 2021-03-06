module TableCloth
  module ConfigurableElements
    OPTIONS = %w(table thead th tbody tr td).map(&:to_sym)

    extend ActiveSupport::Concern

    included do
      OPTIONS.each do |option|
        class_attribute option
        self.send "#{option}=", ActiveSupport::OrderedOptions.new
      end
    end
  end
end