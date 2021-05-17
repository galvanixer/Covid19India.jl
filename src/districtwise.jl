# 3. Districtwise timeseries of Confirmed, Recovered and Deceased numbers.
function get_district_timeseries(district::String)
    df = read_CSV_url(districts_csv_url)
    return df[df[!,:District].==district,:] 
end 
    
# 6. Districtwise Cumulative numbers till date.
function get_state_districts_cumulative(state::String, brief::Bool=true)
    df = read_CSV_url(district_wise_csv_url)
    dfstate = df[df[!,:State].==state,:]

    if brief == true 
        colindices = []
        rmcols = ["SlNo", "State_Code", "District_Key", "Migrated_Other", "District_Notes"]
        for col in rmcols 
            colindex = columnindex(df,col)
            append!(colindices,colindex)
        end
        select!(dfstate,Not(colindices))
    end

    return dfstate
end 