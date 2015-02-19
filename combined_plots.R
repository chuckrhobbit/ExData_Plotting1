####################################################################################
# combined_plots.R 
#  
###################################################################################


prunedata <- function(fulltextfile){
  ############################################################################
  # if called from the comand window with the UCI full dataset
  #  "household_power_consumption.txt" 126.8 MB it will generate the reduced set 
  #  for use in this assignment "pruned_dataset.txt" 179.1 KB
  #  NOTE: This was an early idea the finished scripts download the file from Github
  #############################################################################  
  #open the full dataset file 
    df <- file(fulltextfile)
    
    #truncate or create file for reduced dataset
    nf <- file.create("pruned_dataset.txt")
    newfile <- file("pruned_dataset.txt",open="w+")
    
    #get the headers from the full dataset
    hr<-readLines(df,n=1)
    
    #make them the 1st line of the new file
    writeLines(hr,newfile)
    close(newfile,type="w+")
    
    #get the lines for dates including feb 1st or 2nd 2007
    l <- grep("^[1-2]/2/2007", scan(fulltextfile,what="character",quiet=T),value=T,)
    close(df)
    
    #open the reduced dataset file for appending
    newfile <- file("pruned_dataset.txt",open="at")
  
  #append the subset of lines
    writeLines(l,newfile)
    close(newfile,type="at")
  
    
}


datacheck <- function(dataset){
##################################################################################
# called from each of the plot functions to check for the reduced dataset passed as
#  the paraneter. If the dataset isn't found it gives some instructions on how to
#  build the dataset.
# Notice: this is used but with the dataset being downloaded by each run of the
#         plot scripts it's obsolete. Each plot function looks for "pruned_dataset.txt"
#         as a default.
#
##################################################################################
  #Check for the reduced data file
  if(file.exists(dataset)){
    cat("Found ",dataset,"\n")
    ok = TRUE
  }
  else{
    cat("1. Can't find default: ",dataset,"\n\n")
    ok = FALSE
  }
  
  if(ok==F){
    cat("USAGE: plot_1(\"the dataset.txt\")\n",
        "\nThis script must be run in a working directory containing a reduced dataset text file'\n",
        "\nTRY: download.file(\"https://rawgit.com/chuckrhobbit/ExData_Plotting1/master/pruned_dataset.txt\",\"'datafile.txt'\") from Github",
        "\n\nOR: If you downloaded the 'UCI dataset' :\n\t\tfirst use >prunedata(\"[path to]household_power_consumption.txt\")\n",
        " this will create the reduced dataset called\"pruned_dataset.txt\" in the cwd"
    )
    stop("Need pruned_dataset.txt")
  }
  else{
    cat(" good to go PLEASE WAIT!")
  }
  
  
}


plot_1<- function(dataset="pruned_dataset.txt"){
  #Using the reduced dataset make a histogram of Global_active_power variable
  #Usage: plot_1([the small data set from my repo or created using prunedata() above])
  #example :   plot_1(mydata.txt)
  #dataset URL:
    #"https://rawgit.com/chuckrhobbit/ExData_Plotting1/master/pruned_dataset.txt"
datacheck(dataset)
#build the R data.frame  
data <- read.table(dataset,sep=';',header = T)

#convert the date and time to POSIX and add it to the table
dt <- as.character(paste(data$Date,data$Time))
timedata<-strptime(dt,format="%d/%m/%Y %H:%M:%S")

hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
timedata
}

plot_2<- function(dataset="pruned_dataset.txt",tit="plot 2"){
  #Using the reduced dataset make a histogram of Global_active_power variable
  #Usage: plot_1([the small data set from my repo or created using prunedata() above])
  #example :   plot_1(mydata.txt)
  #dataset URL:
  #"https://rawgit.com/chuckrhobbit/ExData_Plotting1/master/pruned_dataset.txt"

  datacheck(dataset)  
  #build the R data.frame  
  data <- read.table(dataset,sep=';',header = T)
  
  #convert the date and time to POSIX and add it to the table
  dt <- as.character(paste(data$Date,data$Time))
  timedata<-strptime(dt,format="%d/%m/%Y %H:%M:%S")
  dow <- strftime(timedata,format="%A")
  
  plot(timedata,data$Global_active_power,type="l",main=tit,xlab="",
       ylab="Global Active Power(kilowatts)")
  #hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
  
}

plot_3<- function(dataset="pruned_dataset.txt",leg_cex=.75,tit="Plot 3"){
  #Using the reduced dataset make a histogram of Global_active_power variable
  #Usage: plot_1([the small data set from my repo or created using prunedata() above])
  #example :   plot_1(mydata.txt)
  #dataset URL:
  #"https://rawgit.com/chuckrhobbit/ExData_Plotting1/master/pruned_dataset.txt"
  
  datacheck(dataset)  
  #build the R data.frame  
  data <- read.table(dataset,sep=';',header = T)
  
  #convert the date and time to POSIX and add it to the table
  dt <- as.character(paste(data$Date,data$Time))
  timedata<-strptime(dt,format="%d/%m/%Y %H:%M:%S")
  dow <- strftime(timedata,format="%A")
  
  cols <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  #boxplot(data[,6:8],las=3)
 plot(timedata,data$Sub_metering_1,type="n",main=tit,xlab="",ylab="Energy Sub metering",col='red')
 lines(timedata,data$Sub_metering_1,type="l")
 lines(timedata,data$Sub_metering_2,type="l",col="red")
 lines(timedata,data$Sub_metering_3,type="l",col="blue")
 legend("topright",legend=cols,
 lty=c(1,1,1), 
 lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),cex=leg_cex )
 
  #hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
  
}
plot_4<- function(dataset="pruned_dataset.txt"){
  #Using the reduced dataset make a histogram of Global_active_power variable
  #Usage: plot_1([the small data set from my repo or created using prunedata() above])
  #example :   plot_1(mydata.txt)
  #dataset URL:
  #"https://rawgit.com/chuckrhobbit/ExData_Plotting1/master/pruned_dataset.txt"
  
  datacheck(dataset)  
  #build the R data.frame  
  data <- read.table(dataset,sep=';',header = T)
  
  #convert the date and time to POSIX and add it to the table
  dt <- as.character(paste(data$Date,data$Time))
  timedata<-strptime(dt,format="%d/%m/%Y %H:%M:%S")
  
  par(mfrow=c(2,2),cex.lab=.70)
  plot_2(dataset,tit="")
  plot(timedata,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot_3(dataset,leg_cex=.50,tit="")
  plot(timedata,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
}
