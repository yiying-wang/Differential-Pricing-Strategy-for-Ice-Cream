#### Purchases of Ice Cream
ice = read.csv("ice_cream.csv")

## explore
names(ice)

## create a new variable for price per unit
priceper1 = (ice$price_paid_deal + ice$price_paid_non_deal) / ice$quantity
y <- log(1 + priceper1)

#############################Added Code##########################################
## Check the distribution of price per unit before and after log transformation #
hist(priceper1)                                                                 #
hist(y)                                                                         #
#################################################################################

## collect some variables of interest
## create a data.frame
x <- ice[ ,c("flavor_descr", "size1_descr", "household_income", "household_size")]

## relevel 'flavor' to have baseline of vanilla
x$flavor_descr <- relevel(x$flavor_descr, "VAN")
## coupon usage
x$usecoup = factor(ice$coupon_value > 0)
x$couponper1 <- ice$coupon_value / ice$quantity
## organize some demographics
x$region <- factor(ice$region, levels=1:4, labels=c("East","Central","South","West"))
x$married <- factor(ice$marital_status==1)
x$race <- factor(ice$race, levels=1:4, labels=c("white", "black", "asian", "other"))
x$microwave <- ice$kitchen_appliances %in% c(1,4,5,7)
x$sfh <- ice$type_of_residence == 1
x$internet <- ice$household_internet_connection == 1
x$tvcable <- ice$tv_items > 1

#############################Added Code##########################################
## Add new variables to the regression model                                    #
promo <- ice$promotion_type                                                     #
promo[is.na(promo)] <- 0                                                        #
x$haspromo <- factor(promo > 0)                                                 #
x$household_composition <- factor(ice$household_composition)                    #
x$age_and_presence_of_children <- ice$age_and_presence_of_children              #
                                                                                #
### Run Stepwise Regression                                                     #
df <- data.frame(cbind(y,x))                                                    #
model <- lm(y ~ ., data = df)                                                   #
k <- olsrr::ols_step_both_p(model, prem = 0.10, pent = 0.10, details = TRUE)    #
                                                                                #
### Consider selected variables only and create a separate data frame           #
df_sel_var <- data.frame(df$y, df$size1_descr, df$couponper1,df$haspromo,       #
                         df$region, df$flavor_descr,df$usecoup,                 #
                         df$household_composition, df$household_income,         #
                         df$microwave, df$sfh, df$race, df$household_size,      #
                         df$tvcable)                                            #
                                                                                #
model_improved <- glm(y ~ df$size1_descr+ df$couponper1+df$haspromo+            #
                      df$region+df$flavor_descr+df$usecoup+                     #
                      df$household_composition+df$household_income+             #
                      df$microwave+ df$sfh+ df$race+ df$household_size+         #
                      df$tvcable +df$couponper1:df$region +                     #
                      df$couponper1:df$race)                                    #
summary(model_improved)                                                         #
#################################################################################


## grab the non-intercept p-values from a glm
## -1 to drop the intercept, 4 is 4th column
pvals <- summary(model_improved)$coef[-1,4] 

## source the fdr_cut function
source("fdr.R")

fdr(pvals, 0.1, plotit=TRUE)
fdr(pvals, 0.05, plotit=TRUE)
fdr(pvals, 0.01, plotit=TRUE)
