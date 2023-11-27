---
title: "On Machine Learning Interviews"
#subtitle: "Notes, Learnings, and Exercises"
abstract: |
  A collection of notes, learnings, exercises, and solutions developed from working through Chip Huyen's *Machine Learning Interviews*[@huyen:machinelearning:2021]. Sections map directly to their sections in the book unless otherwise specified. We will do our best to provide answers for as many exercise questions as possible.
  
  *For feedback, errata, and suggestions, reach us at [`zee@sparselabs.org`](mailto:zee@sparselabs.org). Copyright \copyright 2023 Sparse Labs Inc., All Rights Reserved.*
date: 27$^{\text{th}}$ November, 2023
author: Zeeshan Hooda[^ucb][^sl]
#- zee:
#  name: Zeeshan Hooda^[University of California, Berkeley]
#  institute: ucb
#  correspondence: "yes"
#  email: zee@sparselabs.org
institute:
  ucb: University of California, Berkeley
numbersections: true
secnumdepth: 4
definition_lists: true
geometry:
- margin=1in
header-includes:
- |
  ```{=latex}
  \usepackage{siunitx}
  \usepackage{ragged2e}
  \usepackage{quoting}
  %\usepackage{hyperref}
  %\def\UrlBreaks{\do\/\do-\do?}
  % For adding extra text to Part page
  %\usepackage{etoolbox}
  %\makeatletter
  %\newcommand{\extraPartText}[1]{\def\@extraPartText{#1}}
  %\pretocmd{\@endpart}{\vspace{8ex}\begingroup\centering\@extraPartText\par\endgroup\let\@extraPartText\relax}{}{}
  %\makeatother
  ```
footnotes: true
toc: true
toc-depth: 4
tableTemplate: |
  *$$tableTitle$$ $$i$$*$$titleDelim$$ $$t$$
documentclass: report
fontsize: 12pt
classoption:
- openany
#- oneside
#- twocolumn
#topleveldivision: part
citeproc: true
bibliography: zees-ml-hiring-notes.bib
csl: ieee.csl
link-citations: true
colorlinks: true
---

[^ucb]: Department of EECS, UC Berkeley
[^sl]: Sparse Labs Inc.

\part{Overview}

This part of the book provides an overview of the machine learning interview process, what roles are available, the skills required for each role, the questions that are asked, and how to prepare for them.
<!-- \cleardoublepage -->
<!-- \clearpage -->


<!-- ML Jobs Notes -->

# Machine Learning Jobs

## Different Machine Learning Roles

- Applications Engineer
- Applied Research Scientist
- Data Scientist
- Developer Advocate
- Framework Engineer
- ML/AI Infrastructure Engineer
- ML/AI Platform Engineer
- Machine Learning Engineer
- Research Engineer
- Research Scientist
- Solution Architect

### Working in Research vs Production

*Research* and *production* are used instead of *academia* vs *industry*, as most ML research today is carried out by large corporations.

- First thing to figure out is if you want to work in research or production
  - different job descriptions, requirements, hiring processes, and compensation
- Goals of research
  - find answers to fundamental questions
  - expand the body of theoretical knowledge
  - validating a hypothesis without worrying about practicallity of results
- Goals of production
  - create or enhance a product
  - product can be goods, services, processes, or business insights
- Research project doesnt need users but product does
- Product has more requirements than research
  - inference latency
  - interpretability (users and developers)
  - fairness
  - adaptability
  - production team ensures these other requirements
- Above definitions are loose
- See CS 329S, Lecture 1 for more differences^[@huyen:cs329s:2021]^

### Research

- Research community has taken "bigger = better" approach, new models need
  - massive amounts of data
  - tens of millions of dollars in compute
  - unaffordable for most institutions wishing to pursue pure research
- Handful of non-academic ML research labs
  - Google Brain, DeepMind
  - Microsoft
  - Facebook
  - Tencent
- Alphabet accounts for 10+% of all NeurIPS papers
- Not all industry labs publish papers
  - Apple and Tesla notoriously secritive
  - Only publish portions of their research
- Consider publishing policy before joining industry lab
  - Secretive labs may not let you explain to others what you've been doing

#### Research vs Applied Research

- Applied research roles
  - somewhere between research and production
  - much closer to research
  - finding solutions to practical problems
  - doesn't involve implementation in production environments
- Applied researchers are researchers
  - come up with, test, and validate hypotheses
  - need to understand practical problems (subject matter expertise)
- Example research project
  - Develop unsupervised transfer learning method for computer vision
  - Experiment on standard academic dataset
- Example applied research project
  - Apply the new method on real-world problems in a specific industry, e.g. healthcare
  - Need expertise in healthcare and machine learning

#### Research Scientist vs Research Engineer

- Research Scientist
  - come up with novel ideas
  - typically requires PhD and first-authorship at top conferences
  - should be adept engineers themselves
  - may act as an advisor to research engineers
- Research Engineer
  - rare role often seen in major research labs in industry
  - use engineering skills to set up and run experiments for novel ideas
  - doesn't require PhD or publications, but is helpful
- Common to see RS and RE as equal contributors on papers
- Job titles are byproduct of beurocracy
  - RS are supposed to have more academic clout
  - RS paid better than RE
- Startups more generous with job titles to attract talent

### Production

ML is finding increasing usage in almost every industry; growing need for bringing ML models to production. This section covers the production ML cycle, required skills, and role distinctions.

#### Production Cycle

1. Project Scoping
  - goals and objectives
  - constraints
  - evaluation criteria
  - stakeholders identified and involved
  - resources estimated and allocated
  - skills
    - product management
    - subject matter expertise
    - some ML knowledge to know what it can and can't solve
2. Data Management
  - data sources, formats, processing, control, and storage
  - data used and generated by ML systems is large and diverse
  - needs scalable infrastructure to process and access it
  - skills
    - databases/query engines for storage/retreival/processing
    - systems engineering for distributed systems to process lots of data
    - minimal ML knowledge to optimize organization of data for ML
3. ML Model Development
  - create training sets from raw data
  - data labelling
  - feature generation
  - model training, optimization, and evaluation
  - skills
    - most ML knowledge
    - statistics and probability
    - programming skills for feature engineering and model development
4. Deployment
  - make model accessible to users after development
  - data-, memory-, and compute-intensive
  - skills
    - infrastructure for running ML application
    - may need ML to compress ML models and optimize latency
5. Monitoring and Maintenance
  - monitor performance degredation and drift
  - mantain/update model to be adaptive in changing environments
  - generating and tracking lots of system-generated data (logs)
  - skills
    - monitoring and maintenance infrastructure
    - data pipelines
6. Business Analysis
  - evaluate model performance against business goals
  - analyze model performance to generate business insights
  - used to eliminate unproductive projects or scope new ones
  - skills
    - ML knowledge to interpret outputs and behavior
    - in-depth statistics to extract insights from data
    - subject matter experties to map insights to the practical problem
    
**Skills**

- **Systems:** systems engineering, building distributed systems, container deployment
- **Databases:** data management, storage, processing, databases, query engines; closely related to **Systems** since distributed systems may be needed for processing lots of data
- **ML:**: linear algebra, ML algorithms, etc.
- **Algorithms:** algorithmic programming
- **Statistics:** probability, statistics
- **SME:** subject matter expertise
- **Production:** product management

Most successful approach to ML production is **iterative and incremental development** --- lots of back and forth among various steps

Common workflow for building model to predict if an ad should be shown during a search query:

1. Choose a metric to optimize
    - might want to optimize for impressions (number of times ad is shown)
2. Collect data and obtain labels
3. Engineer features
4. Train models
5. Error analysis
    i. realize errors are caused by wrong labels
    ii. relabel data
6. Train model again
7. Error analysis
    i. realize model always predicts ad shouldn't be shown because 99.99% of training data is no-show
    ii. collect more data on ads that should be shown
8. Train model again
9. Error analysis
    i. realize model performs well on existing test data from two months ago
    ii. realize model performs poorly on test data from yesterday
    iii. model has degraded, collect more recent data
10. Train model again
11. Deploy model
12. Model is performing well
    i. business people ask why revenue is decreasing
    ii. realize ads are shown but few people click
    iii. decide to change model to optimize for clickthrough instead
13. Start over

Many people work on an ML project in production (ML Engineers, Data Scientists, DevOps Engineers, Subject Matter Experts) all from various backgrounds with different languages and tools. They should all be able to work on the system productively. Cross-functional communication and collaboration is essential.

*Understanding the production cycle is imperative for candidates:*

- idea of what work is needed to bring a model to production
- helps avoid ML projects that are bound to fail

#### ML Engineer vs Software Engineer

- ML engineering considered a subset of software engineering
- Hiring process often spun out of SWE hiring process
  - may swap out a few SWE questions for ML questions
  - may add an interview just focused on ML in addition to SWE interviews
- MLE candidates expected to have programming and software engineering skills
- Many traditional SWE tools used for ML model development and deployment
- Companies used to expect stellar SWE and ML researchers but have since relaxed
- Most prefer hiring great engineers but don't know much ML
  - easier for engineers to pick up ML than ML experts picking up good engineering practices

#### ML Engineer vs Data Scientist

- MLEs and Data Scientists spend time wrangling and understanding data
- Reasons for overlap between roles
  - machine learning is part of data science
  - companies want to start with small ML projects before building a full-fledged team
  - data science tasks (including demant forecasting) can be done using ML models
- Goal of Data Science is to generate business insights
  - Data Scientists tend to be better statisticians
- Goal of ML Engineering is to turn data into products
  - MLEs tend to be better engineers
- Many Data Scientists can do their jobs without ML

#### Other Technical Rolse in ML Production

Many technical roles in the ML ecosystem don't require any ML knowledge, such as tooling and infrastructure development.

**ML Infrastructure Engineer / ML Platform Engineer**

- ML relies on infrastructures that scale
- Companies with mature ML often have dedicated infrastructure teams
- skills
  - parallelism
  - distributed computing
  - low-level optimization
- hard skills to learn, take time to master
  - companies prefer hiring skilled systems engineers, then training them in ML
  
**ML Accelerator / Hardware Engineer**

- hardware is a major bottleneck
- ML algorithms are constrained by slow compute, limited memory, operating cost, on-device power, etc.
- explosion of dedicated ML hardware
- hardware companies need people with ML expertise to guide hardware development
- also looking to use ML algorithms to improve chip design

**ML Solutions Architect**

- often found in professional services companies
- each company has unique use-cases and requirements
- involves working with existing or potential customers
  - figure out if you can help with their use-case
  - design solution for their use-case

**Developer Advocate**

- first users of ML products
- writing tutorials, giving talks
- community engagement
- hard to fill roles
  - difficult to find great engineers with matching communication skills

#### Understanding Roles and Titles

- people on the same team with the same title may do very different things
  - Lyft renamed "Data Analyst"\rightarrow "Data Scientist" and "Data Scientist"\rightarrow "Research Scientist" in 2018
  - roles are fairly interchangeable
- clarifying questions to ask when unsure what a job entails
  - How much of the job involves developing ML models?
  - How much of the job involves data exploration and wrangling?
  - How much of the job involves DevOps?
  - Does the job involve working with clients?
    - What kinds of clients?
    - How many would you need to talk to?
    - How often?
  - Does the job involve reading and/or writing research papers?
  - What are some tools the team can't work without?
  
Going forward, MLE is used as an umbrella for Research Engineer, Developer Advocate, Framework Engineer, Data Scientist, and generic ML Engineer.

## Types of Companies

Different companies offer different roles, require different skills, and should be evaluated with different criteria.

### Applications Companies vs Tooling Companies


### Enterprise vs Consumer Products

### Startups or Big Companies


<!-- ML Interview Process Notes -->

# Machine Learning Interview Process

## Understanding the Interviewers' Mindset

### What Companies Want From Candidates

#### Technical Skills

#### Non-technical Skills

#### What Exactly is Culture Fit?

#### Junior vs Senior Roles

#### Do I need a PhD to Work in ML?

### How Companies Source Candidates

### What Signals Companies Look for in Candidates

## Interview Pipeline

### Common Interview Formats

### Alternative Interview Formats

### Interviews at Big Companies vs at Small Companies

### Interviews for Internships vs for Full-time Positions

## Types of Questions

### Behavioral Questions

#### Background and Resume

#### Interests

#### Communication

#### Personality

### Questions to Ask Your Interviewers

### Bad Interview Questions

## Red Flags

## Timeline

## Understanding Your Odds


<!-- After an Offer Notes -->

# After an Offer

## Compensation Package

### Equity Grants

### Bonuses

### Packages at Different Levels

## Negotiation

### Compensation Expectations

## Career Progression


<!-- Where to Start Notes -->

# Where to Start

## How Long do I Need for My Job Search?

## How Other People Did It

## Resources

### Courses

### Books and Articles

### Other Resources

## Do's and Don'ts for ML Interviews

### Do's

### Don'ts


<!-- Part 2: Questions -->

\part{Questions}
\cleardoublepage
\clearpage

This part of the book contains over 200 knowledge questions of varying difficulty. They cover important concepts and common misconceptions in machine learning. More senior roles should expect harder questions. Several questions are technically incorrect or ambiguous to see if candidates will correct the interviewer, point out edge cases, or ask for clarification.

There are accompanying hints for these questions that should clarify ambiguity or technical incorrectness. The first draft of the book has answers for about 10% of questions, though more can be found as pull-requests in the [book repository](https://github.com/chiphuyen/ml-interviews-book).}


<!-- Math Questions -->

# Math

## Notation {-}

- All vectors are column vectors of dimension $n \times 1$, with $n$ being the number of elements
- The i^th^ element in the dataset is denoted $\mathrm{x}^{(i)}$
- The i^th^ row of an $n \times m$ matrix is $\mathrm{x}_i$

## Algebra and Calculus

### Vectors

### Matricies

### Dimensionality Reduction

### Calcules and Convex Optimization

## Probability and Statistics

### Probability

#### Basic Concepts to Review

#### Questions

### Statistics

<!-- Computer Science Questions -->

# Computer Science

## Algorithms

## Complexity and Numerical Analysis

## Data

### Data Structures

<!-- ML Workflow Questions -->

# Machine Learning Workflows

## Basics

## Sampling and Creating Training Data

## Objective Functions, Metrics, and Evaluation


<!-- ML Algorithm Questions -->

# Machine Learning Algorithms

## Classical Machine Learning

### Basic Algorithms

### Questions

## Deep Learning Architectures and Applications

### Natural Language Processing

### Computer Vision

### Reinforcement Learning

### Other

## Training Neural Networks


<!-- References Section -->

# References {-}
