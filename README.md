Nuforc Scraper
==============

This is a small utility for scraping the NUFORC UFO Database.  

Note: There are **a lot** of things wrong with this project, including:
* Not being in gem format with a legitimate `bin` folder.  
* No throttling on the scraping. Use at your own risk.
* No real logging.

If you have time and the inclination I'm open to PRs to fix some of these things.  Just make sure you're adding tests for everything you do (see the `spec` folder).

Usage
======

`ruby lib/nuforc_scraper scrape <DIR>`

This will scrape all incidents for [every month](http://www.nuforc.org/webreports/ndxevent.html) in the database.

`ruby lib/nuforc_scraper scrape <DIR> --since mm/dd/YYYY`

This will scrape all incidents since a given [posted date](http://www.nuforc.org/webreports/ndxpost.html).  Useful if you have already scraped the database and you just need the delta of the newly added incidents.  
