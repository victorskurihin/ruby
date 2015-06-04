require 'numtheory' # gem install ruby-numtheory

def product(arr)
    def rec_product(n, step, arr)
        return arr[n] if step > n
        newstep = step << 1
        t = rec_product(n, newstep, arr) *
            rec_product(n-step, newstep, arr)
        return t
    end
    rec_product(arr.length-1, 1, arr)
end

$small_odd_swing = [ 1,1,1,3,3,15,5,35,35,315,63,693,231,3003,429,6435,6435,109395,
                  12155,230945,46189,969969,88179,2028117,676039,16900975,1300075,
                  35102025,5014575,145422675,9694845,300540195,300540195 ]

PRECOMPUTED_ODD_SWINGS_NUM = $small_odd_swing.length

def odd_swing(n)
    return $small_odd_swing[n] if n < PRECOMPUTED_ODD_SWINGS_NUM
    root_n = (Math.sqrt n).floor
    prime_list = []
    a_primes = 3.primes_upto(root_n).to_a
    b_primes = (root_n+1).primes_upto(n / 3).to_a
    a_primes.each do |prime|
        q, p = n, 1
        while true do
            q /= prime
            break if q == 0
            p *= prime if q & 1 == 1
        end
        prime_list << p if p > 1
    end
    b_primes.each do |prime|
        prime_list << prime if (n / prime) & 1 == 1
    end
    product(prime_list) * product(((n/2)+1).primes_upto(n).to_a)
end

def rec_factorial(n)
    return 1 if n < 2
    t = rec_factorial(n/2)
    t *= t
    if n < PRECOMPUTED_ODD_SWINGS_NUM
        return t * $small_odd_swing[n]
    else
        $counter -= 1
        return t * $swings[$counter].value
    end
end

$swings = []
$counter = 0

def factorial_primeswing(n)
    $swings = []
    $counter = 0
    shift = 0
    t = n
    while t > 0 do 
        if t >= PRECOMPUTED_ODD_SWINGS_NUM 
            $swings << Thread.new(t) {|t| odd_swing t }
            $counter += 1
        end
        t /= 2
        shift += t 
    end
    return rec_factorial(n) << shift
end

puts factorial_primeswing(100000)
