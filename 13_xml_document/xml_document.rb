class XmlDocument
  def initialize(should_indent = false)
    @should_indent = should_indent
    @indent_level = 0
  end

  def method_missing(tag_name, options = {})
    if block_given?
      @indent_level += 1
      content = yield
      @indent_level -= 1

      line = compose_multiline(tag_name, content, options)
    else
      line = compose_line(tag_name, options)
    end

    format_extremes(line)
  end

  def compose_multiline(tag_name, content, options)
    "#{line_start()}<#{tag_name}#{args_to_s(options)}>" \
    "#{content}" \
    "#{line_start()}</#{tag_name}>"
  end

  def compose_line(tag_name, options)
    "#{line_start()}<#{tag_name}#{args_to_s(options)}/>"
  end

  def line_start()
    "#{newline()}#{tabs()}"
  end

  def newline
    @should_indent ? "\n" : ""
  end

  def tabs
    @should_indent ? "  " * @indent_level : ""
  end

  def format_extremes(lines)
    if @should_indent && @indent_level == 0
      lines.slice!(0)
      lines += "\n"
    end

    lines
  end

  def args_to_s(options = {})
    attributes = options.map { |key, value| "#{key}='#{value}'" }.join(" ")

    attributes.length > 0 ? " #{attributes}" : ""
  end

  def respond_to_missing?(method_name, _include_private = false)
    true
  end
end
