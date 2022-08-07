---
title: 'Ranking'
header: 'Player Ranking'
subheader: 'Hvem er stærkest?'
hero: "images/2021/tournament/dyeislifedk-tietgenkollegiet-tournament-2021-who-is-the-strongest.jpeg"
objectPositionClass: "object-position-40"
---

# Elo Rating

Her følger vi alle turneringsdeltagernes præstationer. Dataene omfatter kun kampene fra [2020](/tournament/2020/), [2021](/tournament/2021/) Tietgen Dye Tournament. Vi beregner styrken af en person ved hjælp af [Elo rating system](https://en.wikipedia.org/wiki/Elo_rating_system). Meget forenklet betyder det, at man får point, når man vinder, og taber ellers. Hvor mange point du får/taber afhænger af din vinder/tabsandsynlighed. Yderligere oplysninger findes [nederst](#elo-rating-system-for-dye) i tabellen.

{{< ranking >}}

## Elo Rating System For Dye

Elo-rating-systemet er en algoritme til at beregne spillernes relative færdighedsniveau. Normalt anvendes det i nulsumsspil, dvs. spil med to sider. Dette er også tilfældet i Dye, men vi ønskede ikke at begrænse vurderingen til hold, men til enkeltpersoner. Derfor bruger vi en brugerdefineret algoritme, som beregner hvert holds gennemsnitlige Elo-rating, resultatet og anvender den vundne eller tabte Elo på hver enkelt person. [Denne artikel](https://elosportschallenge.wordpress.com/2017/06/09/individual-ranking-for-doubles-game/) forklarer konceptet mere indgående.

Detaljer om Python-implementeringen:

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
