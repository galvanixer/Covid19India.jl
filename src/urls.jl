# Daily numbers across C: Confirmed, R:Recovered , D:Deceased and Tested per state (historical data).
timeseries_url = "https://api.covid19india.org/v4/min/timeseries.min.json"

# Current day numbers across districts and states.
data_today_url = "https://api.covid19india.org/v4/min/data.min.json"

# Per day numbers across districts and states - consider using timeseries in place of this. 
# This is a huge file and is a mix of timeseries and data.min.json
data_all_url = "https://api.covid19india.org/v4/min/data-all.min.json"


# Aggregated sheets (CSV files)

# 1. India level timeseries for Confirmed, Recovered and Deceased cases [Reading]
case_time_series_csv_url = "https://api.covid19india.org/csv/latest/case_time_series.csv"

# 2. Statewise timeseries of Confirmed, Recovered and Deceased numbers. [Reading]
states_csv_url = "https://api.covid19india.org/csv/latest/states.csv"	

# 3. Districtwise timeseries of Confirmed, Recovered and Deceased numbers. [Reading]
districts_csv_url = "https://api.covid19india.org/csv/latest/districts.csv"	

# 4. Statewise per day delta of Confirmed, Recovered and Deceased numbers. [Reading]
state_wise_daily_csv_url = "https://api.covid19india.org/csv/latest/state_wise_daily.csv"

# 5. Statewise cumulative numbers till date. [Reading]
state_wise_csv_url = "https://api.covid19india.org/csv/latest/state_wise.csv"

# 6. Districtwise Cumulative numbers till date. [Reading]
district_wise_csv_url =	"https://api.covid19india.org/csv/latest/district_wise.csv"

# 7. Number of tests conducted in each state, ventilators ,hospital bed occupany reported in state bulletins
statewise_tested_numbers_data_csv_url = "https://api.covid19india.org/csv/latest/statewise_tested_numbers_data.csv"	

# 8. Number of tests reported by ICMR
tested_numbers_icmr_data_csv_url = "https://api.covid19india.org/csv/latest/tested_numbers_icmr_data.csv"	

# 9. Number of Labs in each state as per ICMR
icmr_labs_statewise_csv_url = "https://api.covid19india.org/csv/latest/icmr_labs_statewise.csv"	

# 10. List of sources that we are using.
sources_list_csv_url = "https://api.covid19india.org/csv/latest/sources_list.csv"

# 11. Number of RTPCR samples collected statewise in ICMR Application
rtpcr_samples_collected_csv_url	= "http://api.covid19india.org/csv/latest/icmr_rtpcr_tests_daily.csv"	

# 12. Number of vaccine doses administered statewise [Reading]
vaccine_doses_administered_statewise_csv_url = "http://api.covid19india.org/csv/latest/vaccine_doses_statewise.csv"	

# 13. Key data points from CoWin database at a state level
cowin_vaccine_data_statewise_csv_url = "http://api.covid19india.org/csv/latest/cowin_vaccine_data_statewise.csv"

# 14. Key data points from CoWin database at a district level
cowin_vaccine_data_districtwise_csv_url = "http://api.covid19india.org/csv/latest/cowin_vaccine_data_districtwise.csv"	

