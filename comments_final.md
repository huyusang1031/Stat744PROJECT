## BMB

good to put all `library()` statements at the top of the file to make it easier for people who want to render the document/use the code see what they need to install

Code: don't issues lots of separate read.csv files and then `rbind` the results, use a for loop or lapply()!  `purrr::map_dfr` will apply a function to a list and then automatically combine the results into a data frame

This is especialy true of the code in plot 2; there are for loops here, but the code should be reorganized so that you don't need to copy so much code

Very little discussion of ordering of categories/facets, colour palettes chosen ... ?

There are still funny things about the plots that were mentioned in feedback but not corrected:

* e.g. order of legend is different from order of bars in fig 1 (bars are still alphabetical)