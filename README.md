# CRG Games Data Kit

This repo contains a collection of documents, diagrams, and scripts which exist to support my CRG games data kit for roller derby games.

## Configuration scripts

The following commands can be used to configure various components. They should be run from a user shell on a clean Raspbian x64 installation.

### Scoreboard


If you just want to install the latest version :-
`wget https://github.com/awsxdr/crg-data-kit/raw/main/scripts/configure-scoreboard.sh -O - | sh`

If you want to install a particular version :-
`wget https://github.com/awsxdr/crg-data-kit/raw/main/scripts/configure-scoreboard.sh -O - | sh -s v****.*`

### Score display

`wget https://github.com/awsxdr/crg-data-kit/raw/main/scripts/configure-scoredisplay.sh -O - | sh`
