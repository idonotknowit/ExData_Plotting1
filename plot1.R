rm(list=ls());

con <- file("household_power_consumption.txt","r");

n_lines <- 0;
line=readLines(con,n=1);
active_power <- matrix(NA,1,10000);
reactive_power <- matrix(NA,1,10000);
voltage <- matrix(NA,1,10000);
intensity <- matrix(NA,1,10000);
sub1 <- matrix(NA,1,10000);
sub2 <- matrix(NA,1,10000);
sub3 <- matrix(NA,1,10000);

n <- 0;
while( length(line) != 0 ) {    
	line=readLines(con,n=1);
	text <- as.character(line);
	t1 <- charmatch('1/2/2007',text);
	t2 <- charmatch('2/2/2007',text);
	L1 <- is.na(t1);
	L2 <- is.na(t2);
	n <- n + 1;

	if ( L1==FALSE | L2==FALSE ) {
		print(n);
		n_lines <- n_lines + 1;
		str_vector <- unlist(strsplit(text,';'));

		active_power[n_lines] <- as.numeric(str_vector[3]);
		reactive_power[n_lines] <- as.numeric(str_vector[4]);
		voltage[n_lines] <- as.numeric(str_vector[5]);
		intensity[n_lines] <- as.numeric(str_vector[6]);
		sub1[n_lines] <- as.numeric(str_vector[7])
		sub2[n_lines] <- as.numeric(str_vector[8])
		sub3[n_lines] <- as.numeric(str_vector[9])
	}
}
close(con)

bad <- is.na(active_power)
active_power <- active_power[!bad]
reactive_power <- reactive_power[!bad]
voltage <- voltage[!bad]
intensity <- intensity[!bad]
sub1 <- sub1[!bad]
sub2 <- sub2[!bad]
sub3 <- sub3[!bad]

dev.copy(png,'plot1.png')
hist(active_power,col="red",main="Global Active Power")
dev.off()
