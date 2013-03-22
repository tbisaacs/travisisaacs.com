require 'jekyll_asset_pipeline'
require 'bourbon'
require 'sass'

module JekyllAssetPipeline
  class SassConverter < JekyllAssetPipeline::Converter
    require 'sass'

    def self.filetype
      '.sass'
    end

    def convert
      return Sass::Engine.new(@content, syntax: :sass).render
    end
  end
end