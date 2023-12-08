# Reproducible research: version control and R

# Candidate Number: 1064904

# Answers

Link to answers for questions 1-3:

https://github.com/StarfishOx/logistic_growth/blob/385ddd5cf7f6072dc5ba7612c3a31699b3cca5ab/README.md


## Question 4

a) The R script produced two plots, side by side, showing random walks with 500 steps each. Every step is the same size (0.25) and is represented by a point on the plot. The colour of the points corresponds with the time sequence of these steps. I observed that the colour of the points transitioned along a gradient from dark to light blue through the duration of the walks. Each plot showed a different, random pathway through a 2D space (x & y coordinates) but both walks began at coordinates (0,0). The two walks ended at different coordinates.

b) A random seed is a starting point that is used in generating a sequence of pseudorandom numbers. They are used to ensure the reproducibility of results by producing an output which is not truly random and can be repeated by re-running the code. A good analogy is that if you have a book of random numbers and open the book to a specific page, the numbers will be random, but by reopening the book to the same page, the numbers you get will be the same.  In this case, the random seed is the page number. When you set a random seed, you determine an initial state and by setting the same seed again, you will get the exact same output every time.

d) 
<p align="center">
     <img src="https://github.com/StarfishOx/reproducible-research_homework/blob/7a5e940a4e7cf4038d30a6fdfc99950be96e7689/question-5-data/commit_history.png" width="600" height="500">
  </p>


## Question 5
R script can be located in the file 'question_5.R'


a) Number of rows = 33 

Number of columns = 13

b) A log transformation can be used to fit a linear model to the data

c) ($\alpha$) = 1.5152

($\beta$) = exp(7.0748) = 1181.807116

p-value for gradient estimate ($\alpha$) = 6.44e-10

p-value for intercept estimate ($\beta$) = 2.28e-10


The values that I found are the same as those listed in table 2 (when rounded).

d) R script can be located in the file 'question_5.R'

ggplot(aes(log_genome_length, log_volume), data = virus_data) +
  geom_smooth(method = "lm") +
  geom_point() +
  labs(x = "log[Genome length (kb)]", y = "log[Viron volume (nm3)]") +
  theme_bw()

e) Estimated volume = exp(10.8282) = 50422.86 nm3


## Bonus

In scientific research, reproducibility is when the authors share all of the necessary data and codes so that someone else can carry out the same analysis using the same methods and reach the same set of results. Replicability, on the other hand, is when one study is able to acquire the same results as another but with the use of new data or methods of analysis. 

Git and GitHub can enhance the reproducibility of your work due to the fact that they have version control. This means that other researchers can follow the changes made to your project over time and are more easily able to recreate your analysis by following the steps. Git and GitHub also allow the creation of branches. Here, users are able to edit their work without immediately changing the main codebase, meaning that there will be a clean, stable version for themselves and others to see. This enhances both reproducibility and replicability. In addition, these platforms allow several collaborators to work on a single project at the same time while staying up to date with the most recent versions of code. Easy collaboration also facilitates both replicability and reproducibility. 

One limitation of git and GitHub is that they are not as useful for documenting the detailed experimental methods used during scientific research which may not be coding-based. The platform Protocols.io is better suited for this as it allows researchers to share all of the steps of their experimental procedures including information regarding materials and equipment.



## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points (plus an optional bonus question worth 10 extra points). First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   - A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
   - Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
   - Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
   - Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \beta L^{\alpha}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   - Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
   - What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
   - Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - Write the code to reproduce the figure shown below. (10 points)

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  - What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
