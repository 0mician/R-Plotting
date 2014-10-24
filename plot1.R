# The following 2 commands (linux, but there are equivalents on other systems) will
# drastically reduce the number of entries (from 2*10^6 to 2.8*10^3):
###################################################################################
# head -n 1 household_power_consumption.txt > reduced_dataset.txt
# cat houselhold_power_consumption.txt | grep "^[12]/2/2007" >> reduced_dataset.txt
###################################################################################
# Usage: in a R console
# - source("plot1.R")
# - generatePlot1("reduced_dataset.txt")

generatePlot1 <- function(filename) {
    # Open and Load datafile  
    if(file.exists(filename)) {
        hpc <- read.table(filename, header = TRUE, sep = ";")
    }
    else {
        warning("File not found, please verify the entered path: ", filename)
    }

    # Histogram construction and saving to png file
    png(file = "plot1.png", width = 480, height = 480)
    hist(hpc$Global_active_power,
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)",
         ylab = "Frequency",
         col = "red")
    invisible(dev.off())
    message("plot1.png has successfully been generated")
}
