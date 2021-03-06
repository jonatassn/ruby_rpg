def windows?
    return File.exist? "c:/WINDOWS" if RUBY_PLATFORM == 'java'
    RUBY_PLATFORM =~ /mingw32/ || RUBY_PLATFORM =~ /mswin32/
end

def linux?
    return File.exist? "/usr" if RUBY_PLATFORM == 'java'
    RUBY_PLATFORM =~ /linux/
end

def os
    return :linux if self.linux?
    return :windows if self.windows?
    nil
end