module Pod
  class Command
    # This is an example of a cocoapods plugin adding a top-level subcommand
    # to the 'pod' command.
    #
    # You can also create subcommands of existing or new commands. Say you
    # wanted to add a subcommand to `list` to show newly deprecated pods,
    # (e.g. `pod list deprecated`), there are a few things that would need
    # to change.
    #
    # - move this file to `lib/pod/command/list/deprecated.rb` and update
    #   the class to exist in the the Pod::Command::List namespace
    # - change this class to extend from `List` instead of `Command`. This
    #   tells the plugin system that it is a subcommand of `list`.
    # - edit `lib/cocoapods_plugins.rb` to require this file
    #
    # @todo Create a PR to add your plugin to CocoaPods/cocoapods.org
    #       in the `plugins.json` file, once your plugin is released.
    #
    class Fly < Command
      self.summary = '一个致力于更快捷、方便的CocoaPods插件'

      self.description = <<-DESC
        寻找更快速的镜像来缩短下载的时间\n
        更多功能敬请期待，欢迎提供思路\n
        https://github.com/qinglong61/cocoapods-xPlugin\n
        by 段清伦（qinglong6@163.com）
      DESC

      # 不需要参数
      # self.arguments = 'NAME'
      # def initialize(argv)
      #   @name = argv.shift_argument
      #   super
      # end
      # def validate!
      #   super
      #   help! 'A Pod name is required.' unless @name
      # end

      def run
        # UI.puts "Add your implementation for the cocoapods-xPlugin plugin in #{__FILE__}"
        Pod::Command::Install.run(['--verbose'])
      end
    end
  end
end
