def time(entry)
  seconds = (Time.now.to_i - Time.at(entry.created_at.to_i).to_i)
  minutes = (seconds / (60))
end
