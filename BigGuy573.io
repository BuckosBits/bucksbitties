This is a basic workflow to help you get started with Actions

name:bucksbitties/azure/bucksbitties/bitbucket-pipelines-main1.yml

 Controls when the action will run. Triggers the workflow on push or pull request
 events but only for the master branch
on:
  push:https://github.com/MoneyMan573BuckosBits//bucksbitties/workflows/bucksbitties/bitbucket-pipelines-main1.yml
    branches: [ main ]
  pull_request:MoneyMan573/bucksbitties
    branches: [ main ]

 A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
   This workflow contains a single job called "build"
  build:
     The type of runner that the job will run on
    runs-on: ubuntu-latest

     Steps represent a sequence of tasks that will be executed as part of the job
    steps:
       Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v2

       Runs a single command using the runners shell
      - name: Run a one-line script
        run: echo Hello, world!

       Runs a set of commands using the runners shell
      - name: Run a multi-line script
        run: |#test,#verify,#deploy
          echo Add other actions to build,
          echo test, and deploy your project.
MoneyMan573/BuckosBits/bucksbitties
>BigGuy573/bucksbitties-pipelines-main1.yml

<# This is a basic workflow to help you get started with Actions

name:.github.com-BuckosBits-#
# 
 MoneyMan573.main1.yml/pipelines-main.yml

 Controls when the action will run. Triggers the workflow on push or pull request
 events but only for the master branch
 *on: pipelines-main1.yml
  push:https://github.com/BuckosBits/bucksbitties/bitbucket-pipelines-main1.yml
 *branches: [main1]
  pull_request:https://github.com/MoneyMan573/bucksbitties
 *branches: [main]

 A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
   This workflow contains a single job called "build"
  build:
     The type of runner that the job will run on
    runs-on: ubuntu-latest

     Steps represent a sequence of tasks that will be executed as part of the job
    steps:
       Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v2

       Runs a single command using the runners shell
      - name: Run a one-line script
        run: echo Hello, world!

       Runs a set of commands using the runners shell
      - name: Run a multi-line script
        run: | #test, #verify, #deploy
          echo Add other actions to build,
          echo test, and deploy your project.>

master
