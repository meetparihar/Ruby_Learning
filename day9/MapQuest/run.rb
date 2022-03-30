require_relative "./MapQuest"
require_relative "./APIs"
MapQuest::Address.new.get_address('Denver,CO')