# Use a base image with R and Shiny
FROM rocker/shiny:latest

# Install system dependencies
RUN apt-get update && apt-get install -y p7zip-full

# Install R dependencies
RUN R -e "install.packages(c('shiny', 'dplyr', 'openxlsx', 'rlang', 'stringi', 'stringr'))"

# Create a directory for your app
WORKDIR /app

# Copy your app files
COPY ./app.R /app
COPY ./sistec_0.2.0.9012.tar.gz /app/

# Install your R package
RUN R CMD INSTALL /app/sistec_0.2.0.9012.tar.gz && rm /app/sistec_0.2.0.9012.tar.gz

# Expose the port Shiny listens on (default is 3838)
EXPOSE 3838

# Command to run the Shiny app
CMD ["R", "-e", "shiny::runApp('/app', host='0.0.0.0', port=3838)"]