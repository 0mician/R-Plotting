# The following 2 commands (linux, but there are equivalents on other systems) will
# drastically reduce the number of entries (from 2*10^6 to 2.8*10^3):
###################################################################################
# head -n 1 household_power_consumption.txt > reduced_dataset.txt
# cat houselhold_power_consumption.txt | grep "^[12]/2/2007" >> reduced_dataset.txt
###################################################################################
# Usage: in a R console
# - source("plot2.R")
# - generatePlot2("reduced_dataset.txt")

generatePlot3 <- function(filename) {
    # Open and Load datafile  
    if(file.exists(filename)) {
        hpc <- read.table(filename, header = TRUE, sep = ";")
    }
    else {
        warning("File not found, please verify the entered path: ", filename)
    }

    # Transformation of raw "dates" to R objects
    hpc$DateTime <- paste(hpc$Date, hpc$Time, sep = " ")
    hpc$DateTime <- strptime(hpc$DateTime, format = "%d/%m/%Y %H:%M:%S")

    # Plotting and saving to png file
    png(file = "plot3.png", width = 480, height = 480)

    with(hpc, {
        plot(DateTime,
             Sub_metering_1,
             type = "l",
             ylab = "Energy sub metering",
             xlab = "",
             col = "black")
        lines(DateTime,
              Sub_metering_2,
              type = "l",
              col = "red")
        lines(DateTime,
              Sub_metering_3,
              type = "l",
              col = "blue")
    })     
    legend("topright", lty = c(1,1), col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    invisible(dev.off())
    message("plot3.png has successfully been generated")
}
