# Differential Pricing Strategy for Ice Cream
## Executive Summary
An ice cream company wants to boost its margin profits through formulating
differential pricing strategies and carrying out effective coupon promotion activities. To
help them achieve their goal, we analyzed a transaction dataset containing transaction
features such as ‘price paid’, ‘total spend’, product features such as ‘flavor’, ‘size’, and
demographic features of households such as ‘income’, ‘age’, and we build multiple
regression models to explore factors that will impact customers’ willingness to pay,
dictated by ‘price paid per unit’. Moreover, we design Difference-in-Difference analysis to
help them study the causal effect of coupons to different customer groups, which is not
obtainable by simply building regression models.
#### Major findings of our analysis are as follows:
(1) Product features such as flavor and size have significant impacts on customers’
willingness to pay

(2) Demographic features of households such as income, region and household
size have significant impacts on customers’ willingness to pay

(3) Positive interaction exists between coupon and central region regarding
impacts on ‘price per unit’
#### Recommendations are given as follows:
(1) Apply differential pricing strategies to different flavors of ice cream, different
regions and customers with different levels of income

(2) Collect panel data and conduct Difference-in-Difference analysis to analyze
causal effects of coupon to different customer groups, through which they can
improve the effectiveness of promotion activities

### Introduction
An ice cream company is seeking ways to formulate differential pricing strategies
for different customer groups and improve coupon promotion activities to maximize
margin profits. To help them achieve the goal, our analysis will mainly focus on building
linear regression models to explore factors that might impact customers’ willingness to
pay and providing recommendations on making smarter pricing strategies based on
customer segmentations. Moreover, we also suggest other statistic methods to help them
better explore how to enhance the efficiency of their promotion activities such as offering
coupons to customers with high purchase potential more precisely.
### Data Characteristics and Exploration
The dataset contains 2,1975 rows of transaction records along with demographic
information of 6385 households. There are 37 variables in total, among which transaction
data such as price paid, coupon value, features of products such as flavor, size and
quantity of ice cream and demographic data of households such as income, region, race,
age, gender are included.
We calculate ‘price per unit’ for each deal as target variable Y and use other
variables as explanatory variables X. Then we conducted exploratory analysis on
relations between target variable and other variables. Here are what we found. Among all
the explanatory variables, ‘coupon value’ positively correlated with ‘price per unit’,
indicating that higher coupon value may encourage customers to pay higher price per
unit.

Chart above shows that ‘price per unit’ also varies a lot when the household owns
different kinds of kitchen appliances such as microwave and dishwasher, showing that
families holding different machines may have different purchasing power.

Also, as the horizontal bar chart shows, ‘Cherry Grca’ is the most popular flavor
across all regions, but different regions have different preference for different ice cream
flavors.
### Model Selection, Evaluation and Interpretation
Multiple regression model is chosen in this case since it enables us not only to
identify the significance of each independent variable but also to quantify the degree of
impact on the dependent variable of our interest, thereby increasing the power of
interpretation. ‘Price per unit’ is chosen as target variable Y to reflect customers’
willingness to pay since it eliminates the effects of quantity on price. 15 variables such as
‘flavor’, ‘coupon’, ‘marital status’, ‘Hispanic origin’ are chosen as independent variables.

After creating dummy variables for categorical variables, there are 69 independent
variables in total.
Results of the primary regression model shows that whether the household is from
a Hispanic origin or whether it has dishwasher or not are two regressors with insignificant
p-value. These two variables should be removed because they do not influence target
variables. Moreover, variables such as whether there is a promotion, household
composition, age, and presence of children are added as they are logically significant and
have high correlations with ‘price per unit’.
However, in order to improve the performance of the model and minimize the
possibility of overfitting and underfitting, stepwise regression method is deployed. And 13
independent variables out of 16 are retained. Moreover, interaction terms of ‘coupon per
unit’ across region, and ‘coupon per unit’ across race which have statistically significant
impact on ‘price per unit’ are added.
According to the final model, the features of ice cream such as flavor and size do
have significant impacts on target variable. Specifically, some flavors increase customers’
willingness to pay higher price. Assuming the cost of the production hold constant, the
company is advised to produce more ice creams with popular flavors among customers.
In addition, there are several demographic variables showing statistically significant
impacts on ‘price per unit’. Variables such as income, region, and household size are of
operational use. For example, these demographic characteristics can be utilized by the
company to segment customers and apply differential pricing strategies.
Since we included 76 independent variables in total, it is possible that some
unnecessary variables with little explanatory power are mistakenly included in the model.

Based on the significant level of 95%, the false positive rate is approximately 8%, which
means that approximately 3 out of 32 significant variables under the significant level of
95% are in fact non-significant. Since 3 false positive variables seems acceptable, we
keep the criteria of 95% significance level.
Coupons can help almost every business type and size. A successful coupon
marketing strategy not only drives sales, but also helps build brand image. The scatter
plot of coupon value and price per unit shows a strong positive correlation. Therefore, it

is beneficial to focus on studying the causal effects of coupon value with difference-in-
difference (DID) technique. In order to further validate both the significance and the

direction of the impact of certain variables that might be vital in our implementation of
strategy, we designed a difference-in-difference (DID) experiment to identify the causal
relationship between those variables and ‘price per unit’. To do the DID analysis,
customers are divided into two groups based on region. Then take months (June, July,
and August) in summer quarter in one year as the panel data since a year is too long to

conduct an experiment and sales of ice cream varies greatly across quarters. For the pre-
intervention period, the company does not give any coupon, and gives coupon to the

treatment group, for example, households with children, at the middle of July. By
performing DID analysis described above for two groups individually, we can get the
effects of giving coupon on them. After that, comparison of the effects will reveal
customers in which region should be given coupons to maximize the margins.
### Recommendation
Based on our analysis, in order to fully exploit customers’ surplus, the company
can apply different pricing strategy to different flavors of ice cream, location, and

customers with different levels of income. Specifically, the company can increase the
price of ice cream with coffee flavor, ice cream sold in east region, and target coupon at
customer with lower income.
In addition, there exists positive interaction between coupon and central region of
impact on ‘price per unit’. In other words, handing out coupon can bring company more
business value in the central region, therefore company is advised to target the coupon
at customers who lives in central region.
### Conclusion
In this report, we aim to provide analysis support for formulating differential pricing
strategies and effective promotion coupon activities. We build multiple regression models
to explore factors that impact customers’ willingness to pay and we found that flavor and
size of ice cream do have significant impacts on customers’ willingness to pay.
Demographic variables such as income, region and household size show statistically
significant impact on customers’ willingness to pay.
#### Based on the findings, we provide four recommendations:
(1) set higher prices for popular flavors of ice cream, for example, coffee flavor

(2) set higher prices in regions where customers’ willingness to pay is higher, for
example, east region

(3) give out more coupons to customers with lower income, for example, students

(4) collect panel data and carry out Difference-In-Difference analysis to study
coupon’s causal effect on customers of different age groups or region groups and give
out coupons to groups with higher positive effect
