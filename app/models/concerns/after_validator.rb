# frozen_string_literal: true

class AfterValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, attribute_value)
    @record = record
    @attribute = attribute
    @attribute_value = attribute_value

    return if attribute_is_after_requested_attribute?

    record.errors.add(attribute, "#{attribute} must be after #{requested_attribute}")
  end

  private

  attr_reader :record, :attribute, :attribute_value

  def requested_attribute_value
    record.send(requested_attribute)
  end

  def requested_attribute
    options[:attr]
  end

  def nullable?
    options[:null]
  end

  def attribute_is_after_requested_attribute?
    (nullable? && attribute_value.nil?) || attribute_value > requested_attribute_value
  end
end
