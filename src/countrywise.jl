# 1. India level timeseries for Confirmed, Recovered and Deceased cases 
function get_India_timeseries()
    df = read_CSV_url(case_time_series_csv_url)
    return df
end 