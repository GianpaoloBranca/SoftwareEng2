% **Project Plan Document - v1.0**
%Gianpaolo Branca
 Luca Butera
 Andrea Cini
%![](polimi.png)\newpage

\newpage

---
header-includes:
    - \usepackage{placeins}
    - \usepackage{float}
---
#1 Introduction

## 1.1 Purpose and Scope

## 1.2 Definitions, Acronyms, Abbreviations

* Data element type (DET): a unique user recognizable, non recursive, field.
* Record element type (RET): Record elements type, a user recognizable subgroup of data elements.
* File types referenced (FRT): files updated or referenced in a transaction.
* MSO: Money saving option.
* SA: Safe Areas.

## 1.3 Reference documents

# 2 Project size, cost and effort estimation

In this section we will use well known approaches to project planning to estimate di dimension and the cost in time and money that our project will have.
We will use the Function Points approach for the size estimation and than COCOMO for the cost and effort estimation and we will not consider, for the most part, the presentation layer.


## 2.1 Size estimation: function points

In the following tables the reference tables we are going to use for the size estimation, they classify the complexity of each element counting the numbers of file types referenced, data element types and record element types. Obviously we are going to consider these reference values, but we are also going to estimate the complexity of the components based on the specific knowledge that we have acquired about the domain of our system.
<!--- logic files tables -->
\begin{table}[H]
\centering
\caption{Logic Files}
\label{my-label}
\begin{tabular}{|c|c|c|c|}
\hline
                                                     & \multicolumn{3}{c|}{Data Elements}                                                                                                                                             \\ \hline
Record Elements                                      & 1-19                                                    & 20-50                                                    & 51+                                                       \\ \hline
\begin{tabular}[c]{@{}c@{}}1\\ 2-5\\ 6+\end{tabular} & \begin{tabular}[c]{@{}c@{}}Low\\ Low\\ Avg\end{tabular} & \begin{tabular}[c]{@{}c@{}}Low\\ Avg\\ High\end{tabular} & \begin{tabular}[c]{@{}c@{}}Avg\\ High\\ High\end{tabular} \\ \hline
\end{tabular}
\end{table}
<!----->

<!--- External outputs and inquiries -->
\begin{table}[H]
\centering
\caption{My caption}
\label{my-label}
\begin{tabular}{|c|c|c|c|}
\hline
                                                       & \multicolumn{3}{c|}{Data Elements}                                                                                                                                             \\ \hline
File Types                                             & 1-5                                                     & 6-19                                                     & 20+                                                       \\ \hline
\begin{tabular}[c]{@{}c@{}}0-1\\ 2-3\\ 4+\end{tabular} & \begin{tabular}[c]{@{}c@{}}Low\\ Low\\ Avg\end{tabular} & \begin{tabular}[c]{@{}c@{}}Low\\ Avg\\ High\end{tabular} & \begin{tabular}[c]{@{}c@{}}Avg\\ High\\ High\end{tabular} \\ \hline
\end{tabular}
\end{table}
<!----->

<!--- External Input table-->
\begin{table}[H]
\centering
\caption{External Input}
\label{my-label}
\begin{tabular}{|c|c|c|c|}
\hline
                                                       & \multicolumn{3}{c|}{Data Elements}                                                                                                                                             \\ \hline
File Types                                             & 1-4                                                     & 5-15                                                     & 16+                                                       \\ \hline
\begin{tabular}[c]{@{}c@{}}0-1\\ 2-3\\ 4+\end{tabular} & \begin{tabular}[c]{@{}c@{}}Low\\ Low\\ Avg\end{tabular} & \begin{tabular}[c]{@{}c@{}}Low\\ Avg\\ High\end{tabular} & \begin{tabular}[c]{@{}c@{}}Avg\\ High\\ High\end{tabular} \\ \hline
\end{tabular}
\end{table}
<!----->

<!--- Function points table-->
\begin{table}[H]
\centering
\caption{Function Points}
\label{my-label}
\begin{tabular}{|c|c|c|c|}
\hline
                                                                                                                                              & \multicolumn{3}{c|}{Complexity Weight}                                                                                                                                               \\ \hline
Function Type                                                                                                                                 & Low                                                       & Average                                                    & High                                                        \\ \hline
\begin{tabular}[c]{@{}c@{}}Internal Logic Files\\ External Logic Files\\ External Inputs\\ External Outputs\\ External Inquiries\end{tabular} & \begin{tabular}[c]{@{}c@{}}7\\ 5\\ 3\\ 4\\ 3\end{tabular} & \begin{tabular}[c]{@{}c@{}}10\\ 7\\ 4\\ 5\\ 4\end{tabular} & \begin{tabular}[c]{@{}c@{}}15\\ 10\\ 6\\ 7\\ 6\end{tabular} \\ \hline
\end{tabular}
\end{table}
<!----->

### 2.1.1 Internal Logic Files (ILFs)

In this section we are going to analyze the complexity of our ILFs, we are going to refer to this simplified version of the model of the internal representation of our data (some attributes of the classes in the pictures are obviously not persistent but representative of the complexity of the informations related with the single entity):

![](./images/Model.png){#id .class width=100% height=100%}\


* Users:
    - **Estimated complexity**: Average

        The first type of internal data our system will have to deal with are the user related ones. The handling of the user data will include not so trivial operations:  password retrieval, driving license and PayPal account checks and profile personalization functionalities (profile image).

* Rides:
    - **Estimated complexity**: Low

        The rides data handling will be straight forward with the creation of the entity at the start of a ride and the update of the main fields when the ride is ended. The only dynamic aspect of the ride is the "paid" field that has to be updated when the payment is obtained.

* Bookings:
    - **Estimated complexity**: Low

        The information about cars bookings are static and easy to manage.

* Cars:
    - **Estimated complexity**: High

        The status of the cars are is the most critical type of data that our system will have to handle, informations about the cars dynamic and complex to retrieve.

* Assistance requests:
    - **Estimated complexity**: Low

      Easy informations to handle, static once generated(only the status changes only once).

* Fares/PriceVariations:
    - **Estimated complexity**: Low

    Static informations that can be updated by the management system, easy to handle and maintain.

* Safe and RechargingArea:
    - **Estimated complexity**: Average

    Static information about the position of safe areas and dynamic updated to the number of plugs available, average complexity (high complexity only for the creation of the objects)

<!--- ILF table -->
\begin{table}[H]
\centering
\caption{ILF}
\label{my-label}
\begin{tabular}{|c|c|c|}
\hline
ILF                                                                                                                                                                & Complexity                                                                           & FPs                                                                 \\ \hline
\begin{tabular}[c]{@{}c@{}}Users Data\\ Rides Data\\ Bookings Data\\ Cars Data\\ Assistance Requests Data\\ System parameters\\ Areas Data\end{tabular} & \begin{tabular}[c]{@{}c@{}}Average\\ Low\\ Low\\ High\\ Low\\ Low\\ Low\end{tabular} & \begin{tabular}[c]{@{}c@{}}10\\ 7\\ 7\\ 15\\ 7\\ 7\\ 10\end{tabular} \\ \hline
\multicolumn{2}{|l|}{Total}                                                                                                                                                                                                                               & 63                                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

### 2.1.2 External Logic Files (ELFs)

The external data sources we rely on are PayPal, for the payments handling and GoogleMaps for the maps and navigation related services.

* PayPal:
    - **Estimated complexity**: Low

      Simple files containing payment informations.

* GoogleMaps:
    - **Estimated complexity**: High

      WE heavily rely on the files produced by the GoogleMaps service, for both the navigation and the maps functionalities, we consider that both of this elements have to be considered to have an high complexity.

<!--- elfs  table-->
\begin{table}[H]
\centering
\caption{ELF}
\label{my-label}
\begin{tabular}{|c|c|c|}
\hline
ELF                                                                                & Complexity                                                      & FPs                                                 \\ \hline
\begin{tabular}[c]{@{}c@{}}Payment info\\ Navigation Data\\ Maps Data\end{tabular} & \begin{tabular}[c]{@{}c@{}}(Very)Low\\ High\\ High\end{tabular} & \begin{tabular}[c]{@{}c@{}}2\\ 10\\ 10\end{tabular} \\ \hline
\multicolumn{2}{|l|}{Total}                                                                                                                          & 22                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

### 2.1.3 External Inputs (EIs)
We report here the component interfaces diagrams that will become handy in the next sections.

![](./images/components_interfaces.png){#id .class width=100% height=100%}\

Our system will have to deal mainly with the following kinds of inputs:

  * Login/logout of operators and users: simple operations. Both low complexity.

From the users:

  * Login/logout operation: simple operations with simple operations of validations on data. Both operations have a low complexity.
  * Registration: operation of an average complexity, it requires only a small amount of checks.
  * QR-code check-in: simple operation but that requires some components to be handled. Average complexity.
  * car locking/unlocking: simple operations that involve a good number of components. Both average complexity.
  * Search for car: complex operation that needs the collaboration of a good number of components. High complexity.
  * Book/un-book a car: simple operations but that change the status of car. Both average complexity.
  * Payment: simple operation. Low complexity.
  * Money saving option: a complex operation that involves multiple components. High complexity.
  * Ride data: data that the system receive during the ride. Hard to handle, high complexity.

From the operator:

  * Get car overview: complex operation of data retrieval. High complexity.
  * Assistance request: not so complex operation that generates a request form to be sent to the legacy system. Average complexity.
  * Insertion/delation of safe or recharging areas: they are crucial parameters for the system. Both high complexity.
  * Overall view: overall view of all the cars and their position. High complexity.
  * Parameters modification: simple modification but they have to be notified to the users. Average complexity.

<!--- EIS -->
\begin{table}[H]
\centering
\caption{EIS}
\label{my-label}
\begin{tabular}{|c|c|c|}
\hline
EIs                                                                                                                                                                                                                                                          & Complexity                                                                                                                                       & FPs                                                                                               \\ \hline
\begin{tabular}[c]{@{}c@{}}Login/Logout\\ Registration\\ Qr-code check-in\\ Car locking/unlocking\\ Search for a car\\ Book/unbook\\ Payment\\ MSO\\ Ride data\\ Overall view\\ Car overview\\ Assistance request\\ Insert/delete SA\\ Parameters modification\end{tabular} & \begin{tabular}[c]{@{}c@{}}Low\\ Average\\ Average\\ Average\\ High\\ Average\\ Low\\ High\\ High\\ High\\ High\\ Average\\ High\\ Average\end{tabular} & \begin{tabular}[c]{@{}c@{}}2*3\\ 4\\ 4\\ 2*4\\ 6\\ 2*4\\ 3\\ 6\\ 6\\ 6\\ 6\\ 4\\ 2*6\\ 4\end{tabular} \\ \hline
\multicolumn{2}{|l|}{Total}                                                                                                                                                                                                                                                                                                                                                                                     & 83                                                                                                \\ \hline
\end{tabular}
\end{table}
<!----->

### 2.1.4 External Inquiries (EQs)
The main operations of simple data retrieval are:

* User profile: operation of average complexity.
* System parameters and safe area: both operation of average complexity.
* Payment history: low complexity operation, simple interaction with PayPal.
* Ride history: low complexity operation.

<!--- eqs table -->
\begin{table}[H]
\centering
\caption{EQ}
\label{my-label}
\begin{tabular}{|c|c|c|}
\hline
EIs                                                                                                              & Complexity                                                            & FPs                                                     \\ \hline
\begin{tabular}[c]{@{}c@{}}User Profile\\ Payment history\\ Ride history\\ System parameters and SA\end{tabular} & \begin{tabular}[c]{@{}c@{}}Average\\ Low\\ Low\\ Average\end{tabular} & \begin{tabular}[c]{@{}c@{}}4\\ 3\\ 3\\ 2*4\end{tabular} \\ \hline
\multicolumn{2}{|l|}{Total}                                                                                                                                                              & 18                                                      \\ \hline
\end{tabular}
\end{table}
<!----->


### 2.1.5 External Outputs (EOs)

The external output that our system produce are the mainly correlated with the notification system that we estimate having a cost of 12 function points. The other output is the assistance request sent to the legacy system, operation that has an average complexity.

<!--- eos table -->
\begin{table}[H]
\centering
\caption{EOS}
\label{my-label}
\begin{tabular}{|c|c|c|}
\hline
Eos                                                                              & Complexity                                            & FPs                                            \\ \hline
\begin{tabular}[c]{@{}c@{}}Notification system\\ Assistance request\end{tabular} & \begin{tabular}[c]{@{}c@{}}---\\ Average\end{tabular} & \begin{tabular}[c]{@{}c@{}}12\\ 5\end{tabular} \\ \hline
\multicolumn{2}{|l|}{Total}                                                                                                              & 17                                             \\ \hline
\end{tabular}
\end{table}
<!----->

### 2.1.6 Overall Estimation

Our analysis has produced the following data:

<!--- overall table-->
\begin{table}[H]
\centering
\caption{Total function points}
\label{my-label}
\begin{tabular}{|c|c|}
\hline
Function Type                                                                                                                                 & Value                                                          \\ \hline
\begin{tabular}[c]{@{}c@{}}Internal Logic Files\\ External Logic Files\\ External Inputs\\ External Inquiries\\ External Outputs\end{tabular} & \begin{tabular}[c]{@{}c@{}}63\\ 22\\ 83\\ 18\\ 17\end{tabular} \\ \hline
\multicolumn{1}{|l|}{Total}                                                                                                                   & 203                                                            \\ \hline
\end{tabular}
\end{table}
<!----->

With Java Enterprise edition as development platform and without considering in depth the aspects of the development of the mobile and web applications, we end up with the following results:

Average estimation: SLOC = 46 * 203 = **9338**

High estimation: SLOC = 67 * 203 = **13601**

(Function point language table from [_www.qsm.com_](http://www.qsm.com) )



## 2.2 Cost and effort estimation: COCOMO II

In this section we are going to use the COCOMO II model to estimate the cost and effort needed for our project.

### 2.2.1 Scale drivers

<!--- COCOMO scale factors table-->
\begin{table}[]
\centering
\caption{Scale factors values}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
Scale Factors                                            & Very Low                                                                        & Low                                                                             & Nominal                                                                                & High                                                                    & Very High                                                              & Extra high                                                                \\ \hline
\begin{tabular}[c]{@{}l@{}}PREC\\ \\ \\ SFj\end{tabular} & \begin{tabular}[c]{@{}l@{}}thoroughly\\ unprecedented\\ \\ 6.20\end{tabular}    & \begin{tabular}[c]{@{}l@{}}largely\\ unprecedented\\ \\ 4.96\end{tabular}       & \begin{tabular}[c]{@{}l@{}}somewhat\\ unprecedented\\ \\ 3.72\end{tabular}             & \begin{tabular}[c]{@{}l@{}}generally \\ familiar\\ \\ 2.48\end{tabular} & \begin{tabular}[c]{@{}l@{}}largely\\ familiar\\ \\ 1.24\end{tabular}   & \begin{tabular}[c]{@{}l@{}}thoroughly\\ familiar\\ \\ 0.00\end{tabular}   \\ \hline
\begin{tabular}[c]{@{}l@{}}FLEX\\ \\ \\ SFj\end{tabular} & \begin{tabular}[c]{@{}l@{}}rigorous\\ \\ \\ 5.07\end{tabular}                   & \begin{tabular}[c]{@{}l@{}}occasional\\ relaxation\\ \\ 4.05\end{tabular}       & \begin{tabular}[c]{@{}l@{}}some \\ relaxation\\ \\ 3.04\end{tabular}                   & \begin{tabular}[c]{@{}l@{}}general\\ conformity\\ \\ 2.03\end{tabular}  & \begin{tabular}[c]{@{}l@{}}some\\ conformity\\ \\ 1.01\end{tabular}    & \begin{tabular}[c]{@{}l@{}}general\\ goals\\ \\ 0.00\end{tabular}         \\ \hline
\begin{tabular}[c]{@{}l@{}}TEAM\\ \\ \\ SFj\end{tabular} & \begin{tabular}[c]{@{}l@{}}very difficult\\ interactions\\ \\ 5.48\end{tabular} & \begin{tabular}[c]{@{}l@{}}some difficult\\ interactions\\ \\ 4.38\end{tabular} & \begin{tabular}[c]{@{}l@{}}basically \\ cooperative\\ interactions\\ 3.29\end{tabular} & \begin{tabular}[c]{@{}l@{}}largely\\ cooperative\\ \\ 2.19\end{tabular} & \begin{tabular}[c]{@{}l@{}}highly\\ cooperative\\ \\ 1.10\end{tabular} & \begin{tabular}[c]{@{}l@{}}seamless\\ interactions\\ \\ 0.00\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}RESL\\ \\ \\ Sfj\end{tabular} & \begin{tabular}[c]{@{}l@{}}little\\ (20\%)\\ \\ 7.07\end{tabular}               & \begin{tabular}[c]{@{}l@{}}some\\ (40\%)\\ \\ 5.65\end{tabular}                 & \begin{tabular}[c]{@{}l@{}}oftes\\ (60\%)\\ \\ 4.24\end{tabular}                       & \begin{tabular}[c]{@{}l@{}}generally\\ (75\%)\\ \\ 2.83\end{tabular}    & \begin{tabular}[c]{@{}l@{}}mostly\\ (90\%)\\ \\ 1.41\end{tabular}      & \begin{tabular}[c]{@{}l@{}}full\\ (100\%)\\ \\ 0.00\end{tabular}          \\ \hline
\begin{tabular}[c]{@{}l@{}}PMAT\\ \\ \\ SFj\end{tabular} & \begin{tabular}[c]{@{}l@{}}Level 1\\ Lower\\ \\ 7.80\end{tabular}               & \begin{tabular}[c]{@{}l@{}}Level 1\\ Upper\\ \\ 6.24\end{tabular}               & \begin{tabular}[c]{@{}l@{}}Level 2\\ \\ \\ 4.68\end{tabular}                           & \begin{tabular}[c]{@{}l@{}}Level 3\\ \\ \\ 3.12\end{tabular}            & \begin{tabular}[c]{@{}l@{}}Level 4\\ \\ \\ 1.56\end{tabular}           & \begin{tabular}[c]{@{}l@{}}Level 5\\ \\ \\ 0.00\end{tabular}              \\ \hline
\end{tabular}
\end{table}
<!----->

Brief description of the Scale Factors and motivation for our choices:

* **Precedentedness**: reflects the experience of the development team in similar projects. Since our team has no experience in developing large web applications in our case will be low.

* **Flex**: reflects the degree of freedom in the development process in relation to constraints in requirements and external interfaces to use. In our case the requirements are quite strict, but we have a good degree of choice from an implementation point and in some functionalities. We think Nominal it's the correct value.

* **Team**:  reflects the level of cooperation between the team members.
In our case the correct value is high.

* **Risk resolution**: reflects how good the architecture as been defined and if risks has been taken into account. Since we are not expert in designing systems like this one, even if we have a good risk plan, to be conservative, we think that Nominal is the right value.

* **Process maturity**: after problems faced during the the first phases of the project have been overcome, we are q confident of our team capabilities even if we are unexperienced, but it's better to be conservative even in this case. The correct value is Nominal.

<!--- Cost and effort -->
\begin{table}[H]
\centering
\caption{Scale drivers values}
\label{my-label}
\begin{tabular}{|l|c|l|}
\hline
Scale Driver                                                                                                                                                              & Factor                                                                                & Value                                                                                         \\ \hline
\begin{tabular}[c]{@{}l@{}}Precedentedness (PREC)\\ Development flexibility (FLEX)\\ Team cohesion (TEAM)\\ Risk resolution (RESL)\\ Process maturity (PMAT)\end{tabular} & \begin{tabular}[c]{@{}c@{}}Very low\\ Nominal\\ High\\ Nominal\\ Nominal\end{tabular} & \multicolumn{1}{c|}{\begin{tabular}[c]{@{}c@{}}6.20\\ 3.04\\ 2.19\\ 4.24\\ 4.68\end{tabular}} \\ \hline
\multicolumn{2}{|l|}{Total}                                                                                                                                                                                                                                       & 20.35                                                                                         \\ \hline
\end{tabular}
\end{table}
<!----->


### 2.2.2 Cost drivers

* Required Software reliability

    Reliability issues in our system could lead to the loss of resources, but as long as we are quick in detecting the issues relying on a assistance service provided by the legacy system could mitigate the losses. The correct value for the RELY cost driver is Nominal.

<!----->
\begin{table}[H]
\centering
\caption{RELY}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{RELY Cost Driver}                                                                                                                                                                                                                                                                                                                                                                                                                                       \\ \hline
\begin{tabular}[c]{@{}l@{}}RELY\\ Descriptors\end{tabular}   & \begin{tabular}[c]{@{}l@{}}slightly\\ inconvenience\end{tabular} & \begin{tabular}[c]{@{}l@{}}easily\\ recoverable\\ losses\end{tabular} & \begin{tabular}[c]{@{}l@{}}moderate\\ recoverable\\ losses\end{tabular} & \begin{tabular}[c]{@{}l@{}}High \\ financial\\ loss\end{tabular} & \begin{tabular}[c]{@{}l@{}}risk to\\ human\\ life\end{tabular} &                                                      \\ \hline
Rating level                                                 & Very low                                                         & Low                                                                   & Nominal                                                                 & High                                                             & Very High                                                      & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & 0.82                                                             & 0.92                                                                  & 1.00                                                                    & 1.10                                                             & 1.26                                                           & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

* Database size:

    We expect the effective size of out database to be remarkably high in relation to the expected SLOC. A Vary High value is the most sensible choice.



* Required reusability:

    The software produced in our project could be reusable for a car sharing service of a larger scale. The right RUSE cost driver is high.

* Documentation match to life-cycle needs

    The documentation in our project covers the life.cycle need of the system with care. The value is set to Nominal.

* Execution time constraint:

    Since the data flow from the cars and the system is constant we expect and high usage of the CPU with respect to our system computational capabilities. TIME is set to Very High.

* Storage constraint:

    Even if our system will have to deal with a reasonable amount of data, we do not expect problems related to the storage availability. STOR is set to Low.

* Platform Volatility:

    We do not expect the system to be under constant evolution. Nominal is the right value for the PVOL cost driver.

* Analyst Capability:

    We are confident to have done a good work in analyzing the domain of our system. The ACAP driver is set to High.

* Programmer Capability:

* Application experience:

* Platform Experience:

* Language and Tool experience:

* Personnel continuity:

* Usage of Software Tools:

* Multisite development:

* Required development schedule:

* Product complexity:

### 2.2.3 Effort equation

### 2.2.4 Schedule estimation
