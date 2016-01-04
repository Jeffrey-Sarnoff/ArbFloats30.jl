
module ArbFloats30

import Base: convert, promote_rule, promote_type,
    hash, string, show, showcompact,
    (<),(<=),(==),(!=),(>=),(>),isless,isequal,
    zero,one,ldexp,floor,ceil,
    (+),(-),(*),(/),(%),(^),sqrt,hypot,
    exp,expm1,log,log1p,log2,log10,
    sin,cos,tan,cot,
    asin,acos,atan,acot,atan2,
    sinh,cosh,tanh,coth,
    asinh,acosh,atanh,acoth

import Nemo: ArbField, arb, 
    ball, midpoint, radius, trim,
    iszero, isnonzero, isone, isfinite, isexact, 
    isint, ispositive, isnonnegative, isnegative, isnonpositive,
    const_pi, const_e, const_log2, const_log10, const_euler, const_catalan,
    sincos, sinhcosh
    # floor, ceil, sqrt, hypot, atan2, sincos, sinhcosh

typealias Ball arb # types are capitalized in Julia
typealias SystemNum Union{Float64,Float32,Float16,Int128,Int64,Int32,Int16}

export ArbFloat30, showball

immutable (ArbFloat30) <: Real
   re::Ball
end
Real30 = ArbField(127)
convert{T<:SystemNum}(::Type{ArbFloat30}, x::T) = (ArbFloat30)(Real30(x))

TypeSym = :ArbFloat30; RoundDigs=30; FmtStr="%0.30g"
include("type.jl")


# intertype promotion


if isdefined(Main,:ArbFloat70)
  promote_rule(::Type{ArbFloat30}, ::Type{Main.ArbFloat70}) = ArbFloat30
  convert(::Type{ArbFloat30}, x::Main.ArbFloat70) = ArbFloat30(x.re)
end
if isdefined(Main,:ArbFloat140)
  promote_rule(::Type{ArbFloat30}, ::Type{Main.ArbFloat140}) = ArbFloat30
  convert(::Type{ArbFloat30}, x::Main.ArbFloat140) = ArbFloat30(x.re)
end
if isdefined(Main,:ArbFloat300)
  promote_rule(::Type{ArbFloat30}, ::Type{Main.ArbFloat300}) = ArbFloat30
  convert(::Type{ArbFloat30}, x::Main.ArbFloat300) = ArbFloat30(x.re)
end


end # module
