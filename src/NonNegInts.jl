module NonNegInts

export NNInt32, NNInt64

import Base: +, -, *, ÷, div, fld, cld, mod, rem

struct NNInt{T<:Union{UInt32, UInt64}} <: Unsigned
    value::T
end

const NNInt32 = NNInt{UInt32}
const NNInt64 = NNInt{UInt64}


function NNInt32(x::I) where {I<:Signed}
    (signbit(x) || x>typemax(UInt32)) && throw(DomainError("$x"))
    z = x%UInt32
    return NNInt{UInt32}(z)
end

function NNInt32(x::I) where {I<:Unsigned}
    x>typemax(UInt32) && throw(DomainError("$x"))
    z = x%UInt32
    return NNInt{UInt32}(z)
end


function NNInt64(x::I) where {I<:Signed}
    (signbit(x) || x>typemax(UInt64)) && throw(DomainError("$x"))
    z = x%UInt64
    return NNInt{UInt64}(z)
end

function NNInt32(x::I) where {I<:Unsigned}
    x>typemax(UInt64) && throw(DomainError("$x"))
    z = x%UInt64
    return NNInt{UInt64}(z)
end


+(x::NNInt32, y::NNInt32) = NNInt32(x.value + y.value)
-(x::NNInt32, y::NNInt32) = NNInt32(x.value - y.value)
*(x::NNInt32, y::NNInt32) = NNInt32(x.value * y.value)
÷(x::NNInt32, y::NNInt32) = NNInt32(x.value ÷ y.value)

fld(x::NNInt32, y::NNInt32) = NNInt32(fld(x.value, y.value))
cld(x::NNInt32, y::NNInt32) = NNInt32(cld(x.value, y.value))
rem(x::NNInt32, y::NNInt32) = NNInt32(rem(x.value, y.value))
mod(x::NNInt32, y::NNInt32) = NNInt32(mod(x.value, y.value))




end # NonNegInts
