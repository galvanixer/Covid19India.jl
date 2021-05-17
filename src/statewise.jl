export get_state_timeseries, get_state_cumulative,
       get_vaccine_doses_administered_statewise, get_statewise_daily,
       get_active_cases_state

# 2. Statewise timeseries of Confirmed, Recovered and Deceased numbers.	
function get_state_timeseries(state::String)
    df = read_CSV_url(states_csv_url)
    df.Active = df.Confirmed - df.Recovered - df.Deceased
    return df[df[!,:State].==state,:]
end

function get_state_timeseries()
    df = read_CSV_url(states_csv_url)
    df.Active = df.Confirmed - df.Recovered - df.Deceased
    return df
end

# 4. Statewise per day delta of Confirmed, Recovered and Deceased numbers.
function get_statewise_daily()
    df = read_CSV_url(state_wise_daily_csv_url)
    return df 
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

# Function to create state_code to state and vice versa dictionary objects.
function generate_dict_statecodes()
    df = get_state_cumulative()
    codeToStateDict = Dict{String,String}()
    stateToCodeDict = Dict{String,String}()
    nrows = size(df)[1]
    for i in 1:nrows 
        state = df[i,:State]
        code = df[i,:State_code]
        codeToStateDict[code]=state 
        stateToCodeDict[state]=code 
    end 

    return stateToCodeDict, codeToStateDict
end

state_to_code, code_to_state = generate_dict_statecodes()

# Function to calculate active cases on a particular date in all states.
function get_active_cases_state(date::Date)
    df = get_state_timeseries()
    df_today = df[df.Date.==date,:]
    sort!(df_today, :State)

    dateY = date-Dates.Day(1)# date yesterday
    df_yesterday = df[df.Date.==dateY,:]
    sort!(df_yesterday, :State)

    df_today.DeltaDeceased = df_today.Deceased - df_yesterday.Deceased 
    df_today.DeltaActive = df_today.Active - df_yesterday.Active 

    return df_today
end
# function calculate_active_cases_states(date::Date)
#     df = Covid19India.get_statewise_daily()
#     dfdate = df[df[!,:Date_YMD].==date,:]
#     dfout = DataFrame(State=String[], State_code=String[], Confirmed=Int[], Recovered=Int[], Deceased=Int[], Active=Int[], DeltaActive=Int[])
#     nstates = size(dfdate)[2]-3
#     colnames = names(dfdate)
#     for col_id in 1:nstates 
#         state_code = colnames[col_id+3]
#         state=try 
#             code_to_state[state_code]
#         catch e 
#             continue
#         end
#         println(state)
#         confirmed = dfdate[dfdate.Status.=="Confirmed", state_code][1]
#         recovered = dfdate[dfdate.Status.=="Recovered", state_code][1]
#         deceased = dfdate[dfdate.Status.=="Deceased", state_code][1]

#         df_timeseries = Covid19India.get_state_timeseries(state)
#         #df_timeseries_today = df_timeseries[df_timeseries.Date.==date,:]
#         #df_timeseries_yesterday = df_timeseries[df_timeseries.Date=(date-Dates.Day(1))]
#         # active_today = df_timeseries_today[1,"Confirmed"]-df_timeseries_today[1,"Recovered"]-df_timeseries_today[1,"Deceased"]
#         # active_yesterday = df_timeseries_yesterday[1,"Confirmed"]-df_timeseries_yesterday[1,"Recovered"]-df_timeseries_yesterday[1,"Deceased"]
#         # active_delta = active_today - active_yesterday

#         # push!(dfout.State, code_to_state[state_code])
#         # push!(dfout.State_code, state_code)
#         # push!(dfout.Confirmed, confirmed)
#         # push!(dfout.Recovered, recovered)
#         # push!(dfout.Deceased, deceased)
#         # push!(dfout.Active, active_today)
#         # push!(dfout.DeltaActive, active_delta)
#     end

#     return df_timeseries
# end 



# VACCINE DOSES ADMINISTERED.
# 12. Number of vaccine doses administered statewise [Reading]
function get_vaccine_doses_administered_timeseries_statewise()
    df = read_CSV_url(vaccine_doses_administered_statewise_csv_url)
    return df
end

function get_vaccine_doses_administered_timeseries_statewise(state::String)
    df = get_vaccine_doses_administered_timeseries_statewise()
    return df[df[!,:State].==state,:]
end

function get_vaccine_doses_administered_yesterday()
    df = get_vaccine_doses_administered_timeseries_statewise()
    df = df[!,[1,end-2, end-1,end]]
    df.delta_today = df[!,4]-df[!,3]
    df.delta_yesterday = df[!,3]-df[!,2]
    df.delta_diff = df.delta_today - df.delta_yesterday
    sort!(df,:delta_today, rev=true)
    return df
end 

