# frozen_string_literal: true

require 'rails/generators'
require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'

module Rails
  module Generators
    class ScaffoldControllerGenerator < NamedBase
      source_paths << File.expand_path('templates', __dir__)
      hook_for :jbuilder, type: :boolean, default: true

      def singular_name
        file_name.chomp('_controller').singularize
      end

      def class_name
        singular_name.camelize
      end

      def orm_instance(name = singular_name)
        @orm_instance ||= orm_class.new(name)
      end
    end
  end
end
