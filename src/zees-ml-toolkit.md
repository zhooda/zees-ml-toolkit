---
title: "Machine Learning ToolKit"
date: 2023-11-14T10:30:13-07:00
draft: false
author: Zeeshan Hooda
#abstract: |
#  \begin{center}
#  A collection of tools, processes, and information for working with real-world machine learning tasks.
#  \end{center}
summary: "A collection of tools, processes, and information for working with real world machine learning tasks."
date: 14$^{\text{th}}$ November, 2023
contents: true
tags:
- machine learning
numbersections: true
secnumdepth: 3
ShowToc: true
TocOpen: true
definition_lists: true
#geometry:
#- margin=1in
header-includes:
- |
  ```{=latex}
  \usepackage{siunitx}
  \usepackage{ragged2e}
  \usepackage{quoting}
  %\usepackage{hyperref}
  %\def\UrlBreaks{\do\/\do-\do?}
  ```
footnotes: true
toc: true
tableTemplate: |
  *$$tableTitle$$ $$i$$*$$titleDelim$$ $$t$$
citeproc: true
bibliography: src/zees-ml-toolkit.bib
csl: src/ieee.csl
link-citations: true
---
\newpage

\vspace*{\fill}
\begin{center}
\parbox{80mm}{
\textit{Your scientists were so preoccupied with whether they could, they didn’t stop to think if they should.}
}
\end{center}
\begin{center}
\parbox{80mm}{
\begin{flushright}
---\textit{Jurrasic Park}
\end{flushright}
}
\

\

\

\

\end{center}

\vspace*{\fill}

\newpage

# Introduction {-#sec:intro}

This document primarily serves as a collection of tools, processes, and information for real-world machine learning tasks. Plenty of good information already exists regarding the technical aspects of machine learning, so we will focus much more on the tasks that should be carried out before and after algorithm development. Such tasks include gathering requirements, considering ethical ramifications, deciding when ML should or shouldn't be used, deploying models into production, continuous monitoring, and more.

For now, this work may seem unstructured and unorganized, but we will slowly converge on an ideal structure as more items are added.

# Solution Design

## Requirements Gathering

## Sourcing Data

## Ethical Considerations

## When to Use Machine Learning


# Machine Learning

## Supervised Learning

## Unsupervised Learning


# Deep Learning {#sec:nn}

## Neural Networks

A neural network is a computational model of interconnected simplified artificial neurons which exhibit collective computational properties[@hopfield:neuralnetworks:1982]. The emergent properties of neural networks are useful in artificial intelligence tasks with some degree of input ambiguity[@definitionneural].

## Hardware Acceleration {#sec:nn-hw-accel}

As neural networks grow in parameter count, more computational power is required to train them in a reasonable timeframe. Hardware acceleration is often needed when we start to reach the million-parameter mark. Graphics Processing Units (GPU) are the most common hardware accelerators for neural network training and inference, and NVIDIA devices are currently the industry standard. Other hardware accelerators include Tensor Processing Units (TPU) from Google, and Trainium/Inferentia accelerators from AWS.

When measuring compute requirements and accelerator performance for neural networks, we use the units of Floating-point Operations (FLOP) and Floating-point Operations per Second (FLOP/s). Both units can refer to double-, single-, half-, or quarter-precision floating-point numbers, but we assume single-precision 32-bit floats unless otherwise specified.

### CUDA {#sec:nn-hw-cuda}

Compute Unified Device Architecture (CUDA) is a parallel computing platform and API from NVIDIA. It allows software to use GPUs for general purpose parallel computation, such as the linear algebra tasks involved in neural network training[@jang:neuralnetwork:2008]. NVIDIA GPUs contain a large number of CUDA Cores which operate in parallel. The massively parallel nature of GPU computation can decrease training times by orders of magnitudes when compared with training on CPUs. 

### XLA {#sec:nn-hw-xla}

Accelerated Linear Algebra (XLA) is a compiler toolchain for accelerating neural network models with minimal code changes[@xlaoptimizing]. ...

### Neuron {#sec:nn-hw-neuron}

AWS Neuron is an SDK for running deep learning workloads on AWS Trainium and Inferentia instances[@welcomeaws]. ...

## Heuristics

Often when dealing with neural networks, we want rough estimates of compute requirements, training time, and CapEx + OpEx to make decisions on how best to handle model deployment. This section contains a few methods that have yielded high-quality estimations for real client projects.

### Estimating CUDA Performance {#sec:nn-est-cuda}

NVIDIA states that the number of FLOP/s a CUDA device can sustain, $R$, is equivalent to the number of CUDA Cores, $N$, multiplied by the device clock rate, $C$, multiplied by two. The factor of two is derived from the ability to execute two operations at once using fused multiply-add (FFMA) instructions[@achievedflops].

\begin{align}
R = 2 N C
\end{align}

For example, the NVIDIA Tesla P40 GPU has $N = 3,840$ CUDA Cores, and a GPU boost clock, $C = \SI{1.531e9}{Hz}$, so we can derive a reasonable estimate for peak single-precision floating point performance[@newpascal:2016]:

\begin{align}
R_{P40} &= (2) (3,840) (\SI{1.531e9}{Hz}) \nonumber \\
&= \SI{1.176e13}{FLOP/s}
\end{align}

This estimate agrees with the expected value of $\SI{1.2e13}{FLOP/s}$ provided by NVIDIA[@newpascal:2016]. It should be noted this is the _maximum theoretical performance_ when leveraging FFMA. We often observe a 15-25% performance decrease from overhead introduced by the communication interfaces, bus speeds, and memory tiering.

It is possible to further parallelize CUDA workloads with multiple GPU devices in a single system. This introduces some CPU overhead as workloads need to be distributed and orchestrated across multiple units. Certain NVIDIA cards designed for datacenters can directly interface with each other over NVLink, a hardware bridge between units which can avoid CPU orchestration altogether.

### Estimating Training Compute {#sec:nn-est-compute}

...

\begin{align}
C_{train} = O_f O_b P S E
\end{align}

...

### Estimating Training Time {#sec:nn-est-time}

...

\begin{align}
T_{train} = \frac{C_{train}}{R}
\end{align}

...

### Estimating TCO {#sec:nn-est-capex-opex}

Using the defined heuristics for compute and time requirements, we can develop a reasonable estimation for total cost of ownership (TCO) of a particular neural network algorithm, including upfront capital expenditures and ongoing operational expenditures. There are many sources of error that can impact estimated TCO; however, the goal is to find a reasonable range and order of magnitude for making decisions on return-on-investment potential of neural network approaches.

...


# Solution Deployment

## Model Lifecycle

## Hardware and Compute

## Software and Tooling

## Continuous Training

## Monitoring Drift

\newpage

# References
