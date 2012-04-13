# convert positive int to/from a URL-safe base encoding
module IntBaseEncoder
  CHARS = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
  BASE = CHARS.length

  def self.encode(value, min_chars = 1)
    raise ArgumentError, 'value is not an integer' unless value.is_a? Integer
    value += (BASE ** (min_chars - 1)) - 1
    s = []
    while value >= BASE
      value, rem = value.divmod(BASE)
      s << CHARS[rem]
    end
    s << CHARS[value]
    s.reverse.join("")
  end

  def self.decode(str, min_chars = 1)
    str = str.split('').reverse
    total = 0
    str.each_with_index do |v,k|
      total += (CHARS.index(v) * (BASE ** k))
    end
    total - (BASE ** (min_chars - 1)) + 1
  end
end
