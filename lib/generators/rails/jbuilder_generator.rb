# frozen_string_literal: true

require 'rails/generators'

jbuilder_path = Gem::Specification.find_by_name('jbuilder').gem_dir # rubocop:disable Rails/DynamicFindBy
require "#{jbuilder_path}/lib/generators/rails/jbuilder_generator"

module Rails
  module Generators
    class JbuilderGenerator
      source_paths << File.expand_path('templates', __dir__)

      def copy_view_files
        %w[index show].each do |view|
          filename = filename_with_extensions(view)
          template filename, File.join('app/views', controller_file_path, filename)
        end

        template(
          template_with_extensions('partial'),
          File.join('app/views', controller_file_path, filename_with_extensions("_#{singular_name}"))
        )
      end

      def partial_path
        File.join(controller_file_path, singular_name)
      end

      def singular_name
        file_name.chomp('_controller').singularize
      end

      def class_name
        singular_name.camelize
      end

      def controller_file_path
        (controller_class_path + [singular_name]).join('/')
      end

      protected

      def template_with_extensions(name)
        [name, :json, :jbuilder, :tt].join('.')
      end
    end
  end
end
