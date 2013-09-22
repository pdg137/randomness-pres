class Capitalize
  def self.capitalize_each_line(line)
    s = line.dup
    s.split("\n").map { |line|
      line[0] = line[0].upcase
      line
    }.join("\n")
  end

  def self.capitalize_file(filename)
    return capitalize_each_line(File.read(filename))
  end
end
