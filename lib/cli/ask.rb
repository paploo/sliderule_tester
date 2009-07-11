# Need a way to register override commands, so that functions like 'exit' and 'back'
# can be checked for before.  Seems I need a CLI class for that, so that they
# can be registered with handlers, and ask is just part of that!

module CLI
  # Given a question text, it asks it and collects the answer
  def self.ask(question, suffix=': ')
    STDOUT << question.to_s + suffix
    response = gets
    return response && response.chomp
  end
  
  # Given a question, it will continue re-asking the question until valid
  # input is reached.  To determine valid input, the block validates the input
  # by returning true or false
  def self.ask_and_validate(question, suffix=': ')
    is_valid = false
    while( !is_valid )
      response = self.ask(question, suffix)
      is_valid = yield(response) if block_given?
      puts "Invalid response #{response.inspect}, please try again." unless is_valid
    end
    return response
  end
end