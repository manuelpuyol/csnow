class AddNameAndLogoToRoster < ActiveRecord::Migration[6.0]
  def change
    add_column :rosters, :name, :string
    add_column :rosters, :logo, :string

    connection.update(<<-SQL)
      UPDATE rosters
      SET name = teams.name, logo = teams.logo
      FROM teams
      WHERE rosters.team_id = teams.id
    SQL
  end
end
