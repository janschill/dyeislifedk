---
title: 'Ranking'
header: 'Player Ranking'
subheader: 'Who Is the Strongest?'
hero: "images/2021/tournament/dyeislifedk-tietgenkollegiet-tournament-2021-who-is-the-strongest.jpeg"
objectPositionClass: "object-position-40"
---

# Elo Rating

Here we are tracking the performance of all tournament participants. The data includes only the games from the [2020](/tournament/2020/), [2021](/tournament/2021/) Tietgen Dye Tournament.
We are calculating the strength of an individual by using the [Elo rating system](https://en.wikipedia.org/wiki/Elo_rating_system). Very simplified it means you gain points when you win and lose otherwise. The amount of points you gain/lose depend on your win/loss probability. Further information at the [bottom](#elo-rating-system-for-dye) of the table.

{{< ranking >}}

## Elo Rating System For Dye

The Elo rating system is an algorithm to calculate the relative skill levels of players. Usually, it is used in zero-sum games, meaning a game involving two sides. This is also the case in Dye, but we did not want to limit the rating to teams, rather to individuals. Therefore, we use a custom algorithm which calculates each team's average elo rating, the outcome, and applies the gained or lossed Elo to each individual. [This article](https://elosportschallenge.wordpress.com/2017/06/09/individual-ranking-for-doubles-game/) explains the concept more in depth.

Details on the Python implementation:

```python
def probability(rating1, rating2):
    return 1.0 * 1.0 / (1 + 1.0 * math.pow(10, 1.0 * (rating1 - rating2) / 400))

# K is a constant for giving points away.
# d = 1: Player A wins
# d = 2: Player B wins
def elo_rating(rating_player_a, rating_player_b, d):
    K = 50
    # Winning probability for player B
    probability_player_b = probability(rating_player_a, rating_player_b)
    # Winning probability for player A
    probability_player_a = probability(rating_player_b, rating_player_a)

    # Player A wins
    if (d == 1) :
        rpa = rating_player_a + K * (1 - probability_player_a)
        rpb = rating_player_b + K * (0 - probability_player_b)
    # Player B wins
    else :
        rpa = rating_player_a + K * (0 - probability_player_a)
        rpb = rating_player_b + K * (1 - probability_player_b)

    return [rpa, rpb]

def elo_rating_doubles(team1, team2, d):
  t1p1 = team1[0]
  t1p2 = team1[1]
  t2p1 = team2[0]
  t2p2 = team2[1]
  team1_avg_rating = (t1p1['elo_rating'] + t1p2['elo_rating']) / 2
  team2_avg_rating = (t2p1['elo_rating'] + t2p2['elo_rating']) / 2

  new_rating_team1, new_rating_team2 = elo_rating(team1_avg_rating, team2_avg_rating, d)

  new_rating_t1p1 = t1p1['elo_rating'] + new_elo_team1 - team1_avg_rating
  new_rating_t1p2 = t1p2['elo_rating'] + new_elo_team1 - team1_avg_rating
  new_rating_t2p1 = t2p1['elo_rating'] + new_elo_team2 - team2_avg_rating
  new_rating_t2p2 = t2p2['elo_rating'] + new_elo_team2 - team2_avg_rating

  return [new_rating_t1p1, new_rating_t1p2, new_rating_t2p1, new_rating_t2p2]
```
