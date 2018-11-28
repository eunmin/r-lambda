# normal order example
myfn <- function() {
  print("called")
  1
}

myfn2 <- function(x, y) {
  print(x)
}

myfn2(myfn(), myfn())

# church numeral
inc <- function(x) {
  x + 1
}

unchurch <- function(n) {
  n(inc, 0)
}

zero <- function(s, z) { z }
one <- function(s, z) { s(z) }
two <- function(s, z) { s(s(z)) }
three <- function(s, z) { s(s(s(z))) }

plus <- function(x ,y) {
  function (s, z) {
    x(s, y(s, z))
  }
}

print(unchurch(plus(one, two)))

# boolean

true <- function(t, f) { t }
false <- function(t, f) { f }

myif <- function(b, t, f) { b(t, f) }

print(unchurch(myif(false, one, two)))


# loop

Y <- function(y) {
  function(x) {
    y(x, x)
  }(
  function(x) {
    y(x, x)
  })
}

fac <- function(f, n) {
  if(n == 0) {
    1
  } else {
    n * f(n - 1)
  }
}
