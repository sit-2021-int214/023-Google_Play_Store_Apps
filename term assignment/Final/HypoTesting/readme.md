# Hypothesis Testing

### Step to do:

0. Assign variables:
   - u0 or p0
   - xbar or pbar
   - n
   - sd (or sigma)
   - alpha (default is 0.05)
1. State the hypothesis
2. Select Level of significance (alpha)
3. Select Test statistic (This formula for one population)
   - z/t <- (xbar - u0) / (sd/sqrt(n))
   - z <- (pbar-p0) / sqrt((p0\*(1-p0))/n)
4. Finding P-value approach or Critical Value approach
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - talpha for T: `talpha <- qt(p, df, lower.tail = TRUE)`
5. Compare P-value with alpha or z/t with zalpha/talpha
6. Conclusion
## Define question
เฉลี่ย Rating ของแอปพลิเคชั่นทั้งหมดต้องมากกว่าหรือเท่ากับ 4 โดย Alpha = 0.05


### Step 0 : Assign variables
``` ruby
n <- count(app)
sd <- sd(app$Rating) 
xbar <- mean(app$Rating)
u0 <- 4
```
### Step 1 : State the hypothesis
``` ruby
H0:u>=4 
Ha:u<4
```

### Step 2 : Select Level of significance
``` ruby
alpha <- 0.05
```

### Step 3 : Select Test statistic
```ruby
z <- ((xbar - u0) / (sd/sqrt(n)));
z <- z$n
```
#### Result
``` ruby
[1] 28.79458
```
### Step 4 : Finding P-value approach or Critical Value approach
```ruby
# P-value approach
pvalue <- pnorm(z);

# Critical Value approach
zalpha <- qnorm(alpha);
```
#### Result
``` ruby
> pvalue
[1] 1
> zalpha
[1] -1.644854
```

### Step 5 : Compare P-value with alpha or z/t with zalpha/talpha
``` ruby
P-value approach : "Accept H0"
critical value approach : "Accept H0"
```

### Step 6 : Conclusion
Rating ของ Application โดยเฉลี่ยมีค่าอยู่ที่ 4 หรือมากกว่าโดยที่ alpha คือ 0.05
