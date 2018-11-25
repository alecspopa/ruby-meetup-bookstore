# frozen_string_literal: true

class Rails::SwaggerRequestGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :attributes, type: :array, default: [], banner: 'field[:type][:index] field[:type][:index]'

  def create_spec_file
    template 'swagger_spec.rb', File.join('spec/requests', "#{file_path}_spec.rb")
  end

  private

  def singular_name
    file_name.chomp('_controller').singularize
  end

  def controller_class_name
    class_name
  end

  def attributes_list(attributes = attributes_names)
    attributes.map(&:to_s).join(' ')
  end

  def attributes_hash
    attributes.each_with_object({}) do |a, names|
      names[a.name] = a.type
    end
  end
end
