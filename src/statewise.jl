# 2. Statewise timeseries of Confirmed, Recovered and Deceased numbers.	
function get_state_timeseries(state::String)
    df = read_CSV_url(states_csv_url)
    return df[df[!,:State].==state,:]
end

# 5. Statewise cumulative numbers till date.
function get_state_cumulative(brief::Bool=true)
    df = read_CSV_url(state_wise_csv_url)
    if brief == true 
        colindex = columnindex(df,:State_Notes)
        select!(df,Not(colindex))
    end
    return df
end 