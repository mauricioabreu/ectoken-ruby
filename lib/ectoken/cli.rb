module EdgeCastToken
  class CLI
    def self.main
      @options = {}

      option_parser = OptionParser.new do |opts|
        opts.on('-v', '--version', 'Show version') do |v|
          puts EdgeCastToken::VERSION
          exit
        end

        opts.on('-k', '--key=KEY', 'Key to encrypt or decrypt') do |v|
          @options[:key] = v
        end

        opts.on('-t', '--token=TOKEN', 'Token to encrypt or decrypt') do |v|
          @options[:token] = v
        end

        opts.on('-d', '--decrypt', 'Use this option to decrypt data') do |v|
          @options[:decrypt] = true
        end
      end

      option_parser.parse!

      if @options[:key].nil? || @options[:token].nil?
        puts option_parser.help
        exit 1
      end

      case @options[:decrypt].nil?
      when true
        puts Token.encrypt(@options[:key], @options[:token])
      when false
        puts Token.decrypt(@options[:key], @options[:token])
      end
    end
  end
end