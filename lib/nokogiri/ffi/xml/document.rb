module Nokogiri
  module XML
    class Document < Node

      attr_accessor :cstruct

      def parent ; end ; undef_method :parent
      def parent= ; end ; undef_method :parent=

      def self.new(*args)
        version = args.first || "1.0"
        wrap(LibXML.xmlNewDoc(version))
      end

      def self.read_memory(string, url, encoding, options)
        wrap_with_error_handling do
          LibXML.xmlReadMemory(string, string.length, url, encoding, options)
        end
      end

      def self.read_io(io, url, encoding, options)
        wrap_with_error_handling do
          read_proc = lambda do |ctx, buffer, len|
            string = io.read(len)
            return 0 if string.nil?
            LibXML.memcpy(buffer, string, string.length)
            string.length
          end
          close_proc = lambda { |ctx| return 0 }
          
          LibXML.xmlReadIO(read_proc, close_proc, nil, url, encoding, options)
        end
      end

      def self.wrap(ptr) # :nodoc:
        doc = allocate
        doc.cstruct = LibXML::XmlDocument.new(ptr)
        doc.cstruct.private = doc
        doc.instance_eval { @decorators = nil }
        doc
      end

      def serialize
        buf_ptr = MemoryPointer.new :pointer
        size = MemoryPointer.new :int
        LibXML.xmlDocDumpMemory(cstruct, buf_ptr, size)
        buf = Nokogiri::LibXML::XmlAlloc.new(buf_ptr.read_pointer)
        buf.pointer.read_string(size.read_int)
      end

      def type
        cstruct[:type]
      end

      def root
        ptr = LibXML.xmlDocGetRootElement(cstruct)
        ptr.null? ? nil : Node.wrap(LibXML::XmlNode.new(ptr))
      end

      def root=(node)
        LibXML.xmlDocSetRootElement(cstruct, node.cstruct)
        node
      end

      def encoding
        cstruct[:encoding]
      end

      def url
        cstruct[:URL]
      end

      private
      
      def self.wrap_with_error_handling(&block)
        error_list = []
        LibXML.xmlInitParser()
        LibXML.xmlResetLastError()
        LibXML.xmlSetStructuredErrorFunc(nil, SyntaxError.error_array_pusher(error_list))

        ptr = yield
        
        LibXML.xmlSetStructuredErrorFunc(nil, nil)

        if ptr.null?
          error = LibXML.xmlGetLastError()
          if error
            raise SyntaxError.wrap(error)
          else
            raise RuntimeError, "Could not parse document"
          end
        end

        document = wrap(ptr)
        document.errors = error_list
        return document
      end

    end
  end
end
