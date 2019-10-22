const express = require("express");
const { HLTV } = require("hltv");
const _ = require("lodash");

const app = express();

app.get("/", (req, res) => {
  res.send("HLTV data");
});

app.get("/matches", (req, res) => {
  HLTV.getMatches().then(response => {
    res.send(response);
  });
});

app.get("/matchesStats", (req, res) => {
  HLTV.getMatchesStats().then(response => {
    res.send(response);
  });
});

app.get("/results", (req, res) => {
  HLTV.getResults({ pages: 10 }).then(response => {
    res.send(response);
  });
});

app.get("/team/:teamId", (req, res) => {
  const teamId = req.params.teamId;
  HLTV.getTeam({ id: teamId }).then(response => {
    res.send(response);
  });
});

app.get("/player/:playerId", (req, res) => {
  const playerId = req.params.playerId;
  HLTV.getPlayer({ id: playerId }).then(response => {
    res.send(response);
  });
});

app.get("/events", (req, res) => {
  HLTV.getEvents().then(response => {
    res.send(response);
  });
});

app.get("/event/:eventId", (req, res) => {
  const { eventId } = req.params;
  HLTV.getEvent({ id: eventId }).then(response => res.send(response));
});

app.get("/results/:eventId", (req, res) => {
  const { eventId } = req.params;
  HLTV.getResults({ eventID: eventId }).then(response => res.send(response));
});

app.get("/results", (req, res) => {
  HLTV.getResults({ pages: 1 }).then(response => res.send(response));
});

app.get("/playerRankings", (req, res) => {
  HLTV.getPlayerRanking({}).then(response => res.send(response));
});

app.get("/teamRankings", (req, res) => {
  HLTV.getTeamRanking({ year: "2019", month: "september", day: "30" }).then(
    response => res.send(response)
  );
});

const sleep = ms => new Promise(resolve => setTimeout(resolve, ms));

const chunkGet = async (ids, func, dataType, chunk) => {
  let i, temparray;

  let data = [];
  for (i = 0; i < ids.length; i += chunk) {
    // await sleep(1000);
    temparray = ids.slice(i, i + chunk);

    console.log(`${dataType}: ${i} / ${ids.length}`);

    const chunkData = await Promise.all(
      temparray.map(async eventId => {
        try {
          return await func({ id: eventId });
        } catch {
          console.log("error:", dataType, eventId);
        }
      })
    );

    data = data.concat(chunkData);
  }

  return data;
};

app.get("/info", async (req, res) => {
  const info = {};

  const results = await HLTV.getResults({ pages: 1 });
  info["matches"] = results.map(result => ({
    hltvId: result.id,
    team1HltvId: result.team1.id,
    team2HltvId: result.team2.id,
    eventHltvId: result.event.id,
    result: result.result,
    date: result.date
  }));

  await sleep(1000);
  const eventIds = _.uniq(
    results.filter(result => !!result.event.id).map(result => result.event.id)
  );

  const events = await chunkGet(eventIds, HLTV.getEvent, "Event", 1);

  info["events"] = events.map(event => ({
    hltvId: event.id,
    name: event.name,
    dateStart: event.dateStart,
    dateEnd: event.dateEnd,
    location: event.location.name,
    placements: event.prizeDistribution.map(pd => ({
      place: pd.place,
      hltvTeamId: _.get(pd, "team.id"),
      prize: pd.prize
    }))
  }));

  let teamIds = [];
  events.forEach(
    event => (teamIds = teamIds.concat(event.teams.map(team => team.id)))
  );
  teamIds = _.uniq(teamIds);

  const teams = await chunkGet(teamIds, HLTV.getTeam, "Team", 10);

  info["teams"] = teams.map(team => ({
    hltvId: team.id,
    name: team.name,
    logo: team.logo,
    active: true
  }));

  let playerIds = [];
  teams.forEach(
    team =>
      (playerIds = playerIds.concat(team.players.map(player => player.id)))
  );
  playerIds = _.uniq(playerIds);
  playerIds = playerIds.filter(playerId => !_.isNaN(playerId));

  const players = await chunkGet(playerIds, HLTV.getPlayer, "Player", 10);

  info["players"] = players.map(player => ({
    name: player.name,
    nickname: player.ign,
    photo: player.image,
    nationality: player.country.name,
    active: true,
    teamId: player.team.id
  }));

  res.send(info);
});

app.get("/placements", async (req, res) => {
  const events = await chunkGet(eventIds, HLTV.getEvent, "Event", 1);
  const response = events.map(event => ({
    id: event.id,
    placements: event.prizeDistribution.map(pd => ({
      place: pd.place,
      prize: pd.prize,
      teamId: _.get(pd, "team.id")
    }))
  }));

  console.log("DONE");

  res.send({
    events: response
  });
});

app.listen(3000);
