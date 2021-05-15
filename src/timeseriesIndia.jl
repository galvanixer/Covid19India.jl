export CVOTDR 

mutable struct CVOTDR # Confirmed, vaccinated, tested, deceased, recovered
    confirmed::Int 
    vaccinated::Int
    other::Int
    tested::Int 
    deceased::Int 
    recovered::Int
    
    CVOTDR(confirmed, vaccinated, other, tested, deceased, recovered) = new(confirmed, vaccinated, other, tested, deceased, recovered)
end 

function CVOTDR(;confirmed=0, vaccinated=0, other=0, tested=0, deceased=0, recovered=0)
    return CVOTDR(confirmed, vaccinated, other, tested, deceased, recovered)
end 

function CVOTDR(datadict::Dict{String,Int})
    kys = keys(datadict)
    cvotdr = CVOTDR()
    if "confirmed" in kys 
        cvotdr.confirmed = datadict["confirmed"]
    end 
    if "other" in kys 
        cvotdr.other = datadict["other"]
    end
    if "vaccinated" in kys 
        cvotdr.vaccinated = datadict["vaccinated"]
    end
    if "tested" in kys 
        cvotdr.tested = datadict["tested"]
    end
    if "deceased" in kys 
        cvotdr.deceased = datadict["deceased"]
    end
    if "recovered" in kys 
        cvotdr.recovered = datadict["recovered"]
    end
    return cvotdr
end 
    

function get_timeseries_statewise(state::String, date::Dates.Date)
    url = timeseries_url
    try 
        str = make_API_call(url)
        jobj = JSON.Parser.parse(str)
        datadict = jobj[state_dict[state]]["dates"][string(date)]
        df = DataFrame(date=Dates.Date[], delta7=CVOTDR[], delta=CVOTDR[], total=CVOTDR[])
        push!(df.date, date)
        d7data = datadict["delta7"] # delta 7 data 
        tdata = datadict["total"] # total data
        ddata = datadict["delta"] # delta

        d7 = CVOTDR(Dict{String,Int}(d7data))
        d = CVOTDR(Dict{String,Int}(ddata))
        t = CVOTDR(Dict{String,Int}(tdata))
        
        push!(df.delta7, d7)
        push!(df.delta, d)
        push!(df.total, t)

        return df
    catch e 
        return e
    end 
end

function get_districts(state::String)
    url = data_today_url
    try 
        str = make_API_call(url)
        jobj = JSON.Parser.parse(str)
        state = state_dict[state]
        datadict = jobj[state]["districts"]
        return keys(datadict)
    catch e
        return e 
    end 
end 

function get_district_current_data(state::String, district::String)
    url = data_today_url
    try 
        str = make_API_call(url)
        jobj = JSON.Parser.parse(str)
        state = state_dict[state]
        datadict = jobj[state]["districts"][district]
        return datadict
    catch e
        return e 
    end 
end 
