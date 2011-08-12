module KPeg
  module Position
    # STANDALONE START
    def current_column(target=pos)
      return unless string[target - 1]
      o = string[target,1] == "\n" && 1 || 0
      if target - 1 > 0 && c = string.rindex("\n", target - 1)
        target - c - o
      else
        target + 1
      end
    end

    def current_line(target=pos)
      return unless string[target - 1]
      cur_offset = 0
      cur_line = 0

      string.each_line do |line|
        cur_line += 1
        cur_offset += line.size
        return cur_line if cur_offset > target
      end

      cur_line + 1
    end

    def lines
      lines = []
      string.each_line { |l| lines << l }
      lines
    end

    # STANDALONE END

  end
end
