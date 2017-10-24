module Paperclip
  module Validators
    class AttachmentImageDimensionsValidator < ActiveModel::EachValidator
      # def initialize(options)
      # end

      def validate_each(record, attribute, value)
        if value.queued_for_write.present?

          dimensions = Paperclip::Geometry.from_file value.queued_for_write[:original].path

          width = options[:width]
          height = options[:height]

          record.errors.add(attribute, "width must be #{width}px") unless dimensions.width == width
          record.errors.add(attribute, "height must be #{height}px") unless dimensions.height == height
        end
      end

      def self.helper_method_name
        :validates_attachment_image_dimensions
      end

      # def dimensions
      #   Paperclip::Geometry.from_file value.queued_for_write[:original].path
      # end
    end

    module HelperMethods
      def validates_attachment_image_dimensions(*attr_names)
        options = _merge_attributes(attr_names)
        validates_with AttachmentImageDimensionsValidator, options.dup
        validate_before_processing AttachmentImageDimensionsValidator, options.dup
      end
    end
  end
