This is the R code I used for a Meta-Analysis (nothing too interesting just a regular Mean Diff using RE). I mainly rely on the metafor package (thanks to Daddy Wolfgang ^_^ ). 
The code is repeated in both "Outcomes" and "Changes". The only adjustment is the forests' parameters so it looks nice.
I will be uploading the data when the paper is published.

This was done a while ago and I am doing more projects recently. I just wanted to post this first and later on I will upload other projects to show my skill development.

This is the first-ever full meta I did on R, and the main difficulty is satisfying my OCD and building decent forest plots.
Unfortunately, I didn't have enough time (I don't want to fail my finals).


Things that can be improved upon (if I ever find the time):
        1- R is somehow adding extra digits when I import the Excel sheet (randomly) despite using options(digits = 2) and making sure the sheet itself has similar number of digits.
            This makes the forest plot painful with mean and SD showing 0 to 3 digits randomly. 
        2- Forest plot measurements and positions are fun to play with, but it is also annoying that the large results (mean differences) make me generate largely different sizes for each forest plot.
            This will make the paper figures look inconsistent (which again hurts my OCD).
