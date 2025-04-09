# law_comm-e-e
Data and code for modeling ecoregion burned area

Anthropogenic climate change contributions to wildfire-PM2.5 and related mortality in the United States
Beverly E. Law, John T. Abatzoglou, Christopher R. Schwalm, David Byrne, Neal Fann, Nicholas J. Nassikas

Analyses are done at Level 2 ecoregion data : https://www.epa.gov/eco-research/ecoregions-north-america

Files
1. namerica_ecoregion_ba_climate_counterfactual_20022023.csv
   Contains annual forested, non-forested burned area (km2), maximum 90-day mean fwi, and Jan-Sep precipitation from the prior year for each ecoregion. Additionally, counterfactual fwi, precipitation that remove the 20-model mean changes in climate variables are provided, along with counterfactual forest and non-forest burned area.  
2. ecoregion_modeling_counterfactual.m
  MATLAB script for the linear modeling of burned area and application to counterfactual climates.
