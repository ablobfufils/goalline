library("tidyverse")
library("rvest")
library("RSelenium")

#fire up the docker
remDr <- remoteDriver(remoteServerAddr = 'localhost', port = 4445L, browserName ='firefox')

#open the docker
remDr$open()

#url to scrape
remDr$navigate("http://nsmmhl.com/game_details.php?game_id=4441756&schedule_id=401645&league_id=264&date=20190912")

#test to check if working
remDr$screenshot(display=TRUE)

#capture page HTML in readable format
pageHTML <- remDr$getPageSource()[[1]]

#find home team
home_team <- html_node(pageHTML, '#pg_content > table:nth-child(10) > tbody > tr > td:nth-child(1) > table > tbody > tr:nth-child(3) > td:nth-child(1)')