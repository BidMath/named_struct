module NamedStruct
  class Config
    class << self

      attr_reader :members
      def attr_required(*keys)
        @members = keys
        @members.freeze
        attr_reader(*@members)
      end

    end

    attr_required() # init this class with no required attributes

    def initialize(*positional_args, **args)
      if !positional_args.empty?
        raise ArgumentError, "wrong arguments accepts only keyword arguments"
      end
      keys = args.keys
      required_keys = self.class.members
      if keys.sort != required_keys.sort
        if keys.size > required_keys.size
          raise(ArgumentError, "wrong number of arguments (%d for %d)"%
                [keys.size, required_keys.size])
        end
        mising_keys = required_keys - keys
        raise(ArgumentError, "missing keyword: %s"%mising_keys.join(', '))
      end
      args.each{|k, v| instance_variable_set("@#{k}".to_sym, v)}
    end
  end

end
