module Covid19India

using HTTP, JSON
using DataFrames, CSV
using Dates
include("urls.jl")
include("state_ids.jl")
include("helper_functions.jl")
include("timeseriesIndia.jl")
include("statewise.jl")
include("districtwise.jl")
include("countrywise.jl")



end # module
