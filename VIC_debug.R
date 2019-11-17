devtools::load_all()
# library(VICmodel)
# This is a sample data to run VIC.
data(STEHE)

forcing <- STEHE$forcing
soil <- STEHE$soil
veg <- STEHE$veg

# Set the global options for a 7-days run.
vic_param('start_year', 1949)
vic_param('start_month', 1)
vic_param('start_day', 1)
vic_param('end_year', 1949)
vic_param('end_month', 1)
vic_param('end_day', 7)
vic_param('step_per_day', 24)
vic_param('snow_step_per_day', 24)
vic_param('runoff_step_per_day', 24)

# Run VIC.
outputs <- vic(forcing, soil, veg)
print(outputs)

# Use user defind outputs and snowband parameters.
vic_param('nbands', 5)
band <- STEHE$snowbands
