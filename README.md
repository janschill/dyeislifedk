# README

## Design

### Home

* CMS style
  * Sections
  * Section can have content from subpages
  * Content from subpages, content block is defined, actual content can be chosen

### Tournament

* List
  * List all the past/present/(in)active tournaments
  * Register for a tournament
  * Create a new tournament
  * Search for tournament
* Detail
  * Management view (edit)
  * List teams (expandable), Ranking
  * Tournament brackets
  * Register button
  * Gallery

#### Technical Details

* A Team has only one tournament
* Challonge
  * Challonge generates bracket
  * Create tournament and teams in Rails and then Challonge
  * Fetch bracket and status
  * Updates on both systems

### Rules

* Markdown generated
* Markdown editor for admin maybe
