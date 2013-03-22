module Jekyll

  class TagPage < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = tag + '.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
      self.data['tag'] = tag

      tag_title_prefix = site.config['tag_prefix'] || 'Posts tagged "'
      tag_title_suffix = site.config['tag_suffix'] || '"'
      self.data['title'] = "#{tag_title_prefix}#{tag}#{tag_title_suffix}"
    end
  end

  class TagPageGenerator < Generator
    safe true
    
    def generate(site)
      if site.layouts.key? 'tag_index'
        dir = site.config['tag_dir'] || 'tags'
        puts 'Tag Generator: generating ' + site.tags.count.to_s + ' tags to dir /' + dir
        site.tags.keys.each do |tag|
          site.pages << TagPage.new(site, site.source, dir, tag)
        end
      end
    end
  end

end