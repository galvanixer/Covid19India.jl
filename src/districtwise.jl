# 3. Districtwise timeseries of Confirmed, Recovered and Deceased numbers.
function get_district_timeseries(district::String)
    df = read_CSV_url(districts_csv_url)
    return df[df[!,:District].==district,:] 
end 
    
    
# 6. Districtwise Cumulative numbers till date.
function get_state_districts_cumulative(state::String)
    df = read_CSV_url(district_wise_csv_url)
    return df[df[!,:State].==state,:]
end 