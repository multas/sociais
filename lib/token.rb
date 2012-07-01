class Token
  def self.generate(chars = 32)
    (Digest::MD5.hexdigest "#{ActiveSupport::SecureRandom.hex(10)}-#{DateTime.now.to_s}")[0..chars-1]
  end
end

