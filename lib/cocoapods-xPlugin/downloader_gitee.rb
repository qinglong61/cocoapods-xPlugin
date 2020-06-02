require 'cocoapods'
require 'cocoapods-downloader'

module Pod
  module Downloader
    class Git
      alias_method :origin_download!, :download!

      def find_mirror_from_gitee(key)
        require 'rest'
        require 'json'
        mirrors_url = "https://gitee.com/mirrors/#{key}.git"
        if REST.head(mirrors_url).status_code == 404
          search_url = "https://gitee.com/search/relative_project?q=#{key}"
          resp = REST.get(search_url)
          json = JSON.parse resp.body
          if json
            json["data"].each do |item|
              path = item["path_ns"]
              repo_name = path.split('/')[-1]
              if repo_name == key
                return "https://gitee.com/#{path}.git"
              end
            end
          end
        else
          return mirrors_url
        end
        return nil
      end

      def download_from_gitee!
        repo_name = url.split('/')[-1].chomp('.git')
        new_url = find_mirror_from_gitee(repo_name)
        if new_url
          origin_url = @url
          @url = new_url
          Pod::UI.puts "\nredirect to #{@url}\n".blue
        end
        begin
          origin_download!
        rescue
          if @url == new_url
            @url = origin_url
            Pod::UI.puts "\nback to #{@url}\n".green
            origin_download!
          end
        end
      end

      def download!
        if url.start_with?('https://github.com/')
          download_from_gitee!
        else
          origin_download!
        end
      end

    end
  end
end

# gem build *.gemspec
# sudo gem install *.gem