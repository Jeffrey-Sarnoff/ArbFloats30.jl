## ArbFloats30.jl
accurate floating point math at 30 digits

```ruby
        Jeffrey A. Sarnoff                           2015-Dec-31 06:00:00 UTC America/New_York
```                    

#####exports ArbFloat30


*__+__*  
   Calculations are substantially faster than BigFloat.  
   Accuracy more consistently tracks displayed precision than BigFloat.  

*__-__*  
   Pulls in all of Nemo to use some of Arb.  
   Does not implement some math functions and other operators available with Float64.  
   
=====



```julia

julia> using ArbFloats30

julia> a=ArbFloat30(2);sqrt2=sqrt(a)
1.4142135623730950488016887242096980786
julia> showball(sqrt2)
[1.4142135623730950488016887242096980786 +/- 4.87e-38]

```

ArbFloat30, ArbFloat70, ArbFloat140, ArbFloat300 can be used together.  
Intertype promotion defers to the smaller type (otherwise the result could become quite inaccurate invisibly):  

```julia
using ArbFloat30
using ArbFloat300

a=sqrt(ArbFloat30(256))
16
b=sqrt(ArbFloat300(1024))
32
c=a+b; c, typeof(c)
48, ArbFloat30

```

-----
   

This relies *entirely* on Fredrik Johansson's Arb software, which is included with William Hart's Nemo package.  
The Arb documentation is at http://fredrikj.net/arb/.  The documentation for Nemo is at http://nemocas.org.  
You will see Nemo's welcome message.  _Nemo is required unless Arb is separately available to Julia._

This is separated from ArbFloats.jl (q.v.).
