module AskWrapper
  def yes_no(question)
    expect(ask("#{question} [Y/N]")).to match /y/i
  end
end

World(AskWrapper)