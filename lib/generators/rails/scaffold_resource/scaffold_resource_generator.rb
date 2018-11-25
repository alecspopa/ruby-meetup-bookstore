# frozen_string_literal: true

require 'rails/generators/rails/resource/resource_generator'

class Rails::ScaffoldResourceGenerator < Rails::Generators::ResourceGenerator
  remove_hook_for :resource_controller, :resource_route
  remove_class_option :actions

  class_option :controller_namespace, type: :string,
    desc: 'The controller namespace.', default: 'Api::V1'

  hook_for :scaffold_controller, in: :rails do |instance, controller|
    controller_namespace = instance.options[:controller_namespace]

    attributes = instance.attributes.each_with_object([]) do |a, attrs|
      attrs << "#{a.name}:#{a.type}"
    end

    args = ["#{controller_namespace}::#{instance.name.demodulize}", attributes]
    opts = ['--skip-test-framework']
    instance.invoke controller, args, opts
  end

  hook_for :api_documentation do |instance, controller|
    controller_namespace = instance.options[:controller_namespace]

    attributes = instance.attributes.each_with_object([]) do |a, attrs|
      attrs << "#{a.name}:#{a.type}"
    end

    instance.invoke controller, ["#{controller_namespace}::#{instance.name.demodulize}", attributes]
  end
end
