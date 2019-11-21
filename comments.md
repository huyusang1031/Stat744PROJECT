(from BMB)

* we have a pretty strong preference for editable formats (text, LaTeX, markdown, etc.) over PDF/docx etc. ...

* Plot 1
    *  this sounds very busy (16 colours is probably too many), although the interactive features may rescue you. Consider a smaller number of colours, and finding a way to highlight the neighbourhood that's being hovered over/clicked on (alternately, use a Shiny app to allow the user to select).
	* if information is important for comparison, try to find a way to include it in the plot rather than just in the tooltip. Information in the tooltips is really just a fancy look-up table - for example, it's very hard to compare the information that would be in two or more different tooltips. Try to think about how you can represent the *most important* comparisons visually, reserving the tooltips for auxiliary or less important information (e.g. address)

Plot 2:
	* dynamic summary information - are you planning to write a shiny app, or do you have some other platform in mind for implementing this?  Are you going to write this dynamic map in leaflet?  Keep in mind that you'll have to do some extra work to export the density polygons to leaflet (see the "John Snow cholera example" https://freakonometrics.hypotheses.org/19473)
	
This pair of plots will be reasonable, if you put enough effort in to make them attractive and useful. We are aware that there are lots and lots of resources using Airbnb data from various localities in data visualization (e.g. https://www.google.com/search?client=ubuntu&channel=fs&q=airbnb+visualization+R): when you write up your project, please be very explicit about which resources you used, and how you leveraged existing tools and improved on them.



	
