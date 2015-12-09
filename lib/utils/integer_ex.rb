module IntegerEx
  refine Integer.singleton_class do
    def max()
      n_bytes = [42].pack('i').size
      n_bits = n_bytes * 16
      2 ** (n_bits - 2) - 1
    end

    def min()
      -(self.max()) - 1
    end
  end
end
