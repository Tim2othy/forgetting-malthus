Draft!

= Introduction


In XXX LONG-TERM ECONOMIC GROWTH AND THE HISTORY OF TECHNOLOGY Joel Mokyr poses and tries to answer the following question:

#quote(block: true)[
  _Is sustained economic growth and continuous change the “normal” state of the economy, unless it is blocked by specific “barriers to riches”, or is the stationary state the normal condition, and the experience of the past 200 years is truly a revolutionary regime change?_]

I have a simple model trying to answer a version of this question.

== My Hypothesis and Assumptions

Assumptions:
+ In the past people lived in a mathusian state of nature.
+ If productivity increased this lead to more people, no rise in well being.
+ They sometimes have useful ideas, that improve productivity.
+ They sometimes forget ideas.

Hypothesis:
I suspect that this state will lead to long term growth under realistic parameter choices.

Background:
Economic historians seem to make the following argument a lot:
- We were in a mathusian state until around 1800, maybe a bit earlier.
- Modern economic growth started around then.

I find this somewhat unconvincing and confusing.

Even if we only really care about GDP per capita $y$ and so leaving the malthusian age was important, there is a way of looking at history where this point in time didn't especially stand out.
Ok so people produce ideas, that increases productivity, leads to more people, eventually we are rich enough or have fast enough growth so that we get sustained growth in per capita income.

But nothing about the underlying process that increased productivity changed at that point in time did it?
So what should matter for an economic historian isn't $y$ but really total factor productivity. So that we can distingush two societies with the same $y$ but different population densities.
One has a lot of land per person but a small $A$ the other a large $A$.

Now having done this two interesting questions remain:

+ Why did total factor productivity start to grow faster around 1800?
+ Was this enevitable?


The simplest model aswering question 1 says: more people lead to more ideas, so more productivity, so more people.
And that there was nothing special about 1800.


For question 2 the simplest model says:
- People sometimes forget ideas
- They sometimes find new ideas

this leads to... lets see.


== The Model

#set math.equation(numbering: "(1)")

This model is based on the model of XXX of Lee (1988).
I abandon the attemt to make it have a closed for solution and instead make it more realistic.

$
  Y_t = A_t L_t^(1-beta) \
$<one>
$
  dot(A_t) =gamma L_t A_t^ϕ \
$<two>
$
  dot(L_t) = L_t f(y_t)
$<three>

@one is the production function.
There would be constant returns to scale in land and population, but land is fixed so we have deminishing returns to scale without ideas.
With ideas there are increasing returns to scale.

@two is the standard Romer or Jones Idea production function. There is no stepping on toes effect for simplicity and because in small historical populations this effect is probably minor.

@three gives the change in population.
$f(y)$ is the malthusian element. Only if $y$ is larger than some value $dash(y)$ is population change positive, otherwise it is negative.
I set $dash(y)= 1$ and for simplicity I will first assume a simple quasi linear model.
$
  f(y) = cases(
    y - 1 wide & "if" y in [0, 1+n],
    n wide & "if" y > 1+n
  )
$
Here $n$ is the maximum possible growth rate.
Because this differential equation is linear in population so we can immediatly write it as a growth rate
$
  dot(L_t)/L_t = f(y_t) = min(n, y - 1)
$<four>

Now the important thing in this model is that ideas can be foregotton.
Ideas depreciate akin to capital in the Solow model.
$
  dot(A_t) =gamma L_t A_t^ϕ - delta A\
$
Is this the right specification?
We can see what this predicts and then add in, possibly population later into the forgetting mechanism.
