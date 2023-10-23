class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.flat_map do |team|
      team.players_by_position(position)
    end
  end

  def all_players_by_position
    all_players_by_position = Hash.new { |hash, key| hash[key] = [] }
    @teams.each do |team|
      team.players.each do |player|
        all_players_by_position[player.position] << player
      end
    end
    all_players_by_position
  end
end