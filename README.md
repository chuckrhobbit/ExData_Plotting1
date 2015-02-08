## Course Project 1 Analytical Plotting

This is a class assignment.
===============================================================================
Class Instructions :

For each plot you should

1) Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

2) Name each of the plot files as plot1.png, plot2.png, etc.

3) Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file.

4) Add the PNG file and R code file to your git repository
==================================================================================
FILES :
  combined_plots.R : contains functions used in all the plot R scripts
  plot1.R : draws graph of plot 1
  plot2.R : draws graph of plot 2
  plot3.R : draws graph of plot 3
  plot4.R : draws graph of plot 4
  
  IMAGE FILES of the graphs above
  plot1.png
  plot2.png
  plot3.png
  plot4.png
  
  pruned_dataset.txt : Reduced dataset of the UCI power consumtion dataset 
                       and is explained in the codebook
                       
  codebook.txt : dataset schema
  readme.md : this file

==================================================================================
USAGE & DISCRIPTION:
  1)plot_.R scripts
    Each of the plot_.R scripts call functions of the same base name defined in 
    combined_plots.R with the reduced dataset as the parameter. 
    ie. plot_1("datafile"). combined_plots.R is sourced in each plot_.R script.
    These scripts don't depend on the reduced dataset being in the cwd. 
    The pruned_dataset.txt file is downloaded from Github each run.
    To run these scripts combined_plots.R must be available in the cwd.  
  
  
  2)combined_plots.R
        Contains
            a function to generate each plot like plot_1("dataset").
            some data manipulation and checking functions    
    





===================================================================================