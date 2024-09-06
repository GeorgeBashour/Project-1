This is the R code I used for a Meta-Analysis (nothing too interesting just a regular Mean Diff using RE). I mainly rely on the metafor package (thanks to Daddy Wolfgang). 
The code is repeated in both "Outcomes" and "Changes". The only adjustment is the forests' parameters so it looks nice.
I will be uploading the forest plots and the Data when the paper is published.

This is the first-ever full meta I do on R, and the main difficulty is satisfying my OCD and building decent forest plots.
Unfortunately, I don't have enough time (I don't want to fail my finals).
Things that can be improved upon:
        1- R is somehow adding extra digits when I import the Excel sheet (randomly) despite using options(digits = 2) and making sure the sheet itself has similar number of digits.
            This makes the forest plot painful with mean and SD showing 0 to 3 digits randomly. 
        2- Forest plot measurements and positions are fun to play with, but it is also annoying that the large results (mean differences) make me generate largely different sizes for each forest plot.
            This will make the paper figures look inconsistent (which again hurts my OCD).
        3- I am using the plain reporter function from the metafor package. It is great to automate most of the results (the numbers and tests mainly). The issue is that it gives a base forest plot.. which is
            super ugly. I think there should be a way to insert the custom forest plot instead of just exporting them manually and pasting them in the word file.
