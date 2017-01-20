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
    - \usepackage{listings}
    - \usepackage{color}
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

      We heavily rely on the files produced by the GoogleMaps service, for both the navigation and the maps functionalities, we consider that both of this elements have to be considered to have an high complexity.

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
  * Insertion/delation of a car: complex operations involving multiple components. Both high complexity.
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
\begin{tabular}[c]{@{}c@{}}Login/Logout\\ Registration\\ Qr-code check-in\\ Car locking/unlocking\\ Search for a car\\ Book/unbook\\ Payment\\ MSO\\ Ride data\\ Overall view\\ Car overview\\ Assistance request\\ Insert/delete SA\\ Insert/delete car\\ Parameters modification\end{tabular} & \begin{tabular}[c]{@{}c@{}}Low\\ Average\\ Average\\ Average\\ High\\ Average\\ Low\\ High\\ High\\ High\\ High\\ Average\\ High\\ High\\ Average\end{tabular} & \begin{tabular}[c]{@{}c@{}}2*3\\ 4\\ 4\\ 2*4\\ 6\\ 2*4\\ 3\\ 6\\ 6\\ 6\\ 6\\ 4\\ 2*6\\ 2*6\\ 4\end{tabular} \\ \hline
\multicolumn{2}{|l|}{Total}                                                                                                                                                                                                                                                                                                                                                                                     & 95                                                                                                \\ \hline
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
\begin{tabular}[c]{@{}c@{}}Internal Logic Files\\ External Logic Files\\ External Inputs\\ External Inquiries\\ External Outputs\end{tabular} & \begin{tabular}[c]{@{}c@{}}63\\ 22\\ 95\\ 18\\ 17\end{tabular} \\ \hline
\multicolumn{1}{|l|}{Total}                                                                                                                   & 215                                                            \\ \hline
\end{tabular}
\end{table}
<!----->

With Java Enterprise edition as development platform and without considering in depth the aspects of the development of the mobile and web applications, we end up with the following results:

Average estimation: SLOC = 46 * 215 = **9890**

High estimation: SLOC = 67 * 215 = **14405**

(Function point language table from [_www.qsm.com_](http://www.qsm.com) )



## 2.2 Cost and effort estimation: COCOMO II

In this section we are going to use the COCOMO II model to estimate the cost and effort needed for our project.

### 2.2.1 Scale drivers

<!--- COCOMO scale factors table-->
\begin{table}[H]
\centering
\caption{Scale factors values}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
SFs                                            & Very Low                                                                        & Low                                                                             & Nominal                                                                                & High                                                                    & Very High                                                              & Extra high                                                                \\ \hline
\begin{tabular}[c]{@{}l@{}}PREC\\ \\ \\ SFj\end{tabular} & \begin{tabular}[c]{@{}l@{}}thoroughly\\ unprecedented\\ \\ 6.20\end{tabular}    & \begin{tabular}[c]{@{}l@{}}largely\\ unprecedented\\ \\ 4.96\end{tabular}       & \begin{tabular}[c]{@{}l@{}}somewhat\\ unprecedented\\ \\ 3.72\end{tabular}             & \begin{tabular}[c]{@{}l@{}}generally \\ familiar\\ \\ 2.48\end{tabular} & \begin{tabular}[c]{@{}l@{}}largely\\ familiar\\ \\ 1.24\end{tabular}   & \begin{tabular}[c]{@{}l@{}}thoroughly\\ familiar\\ \\ 0.00\end{tabular}   \\ \hline
\begin{tabular}[c]{@{}l@{}}FLEX\\ \\ \\ SFj\end{tabular} & \begin{tabular}[c]{@{}l@{}}rigorous\\ \\ \\ 5.07\end{tabular}                   & \begin{tabular}[c]{@{}l@{}}occasional\\ relaxation\\ \\ 4.05\end{tabular}       & \begin{tabular}[c]{@{}l@{}}some \\ relaxation\\ \\ 3.04\end{tabular}                   & \begin{tabular}[c]{@{}l@{}}general\\ conformity\\ \\ 2.03\end{tabular}  & \begin{tabular}[c]{@{}l@{}}some\\ conformity\\ \\ 1.01\end{tabular}    & \begin{tabular}[c]{@{}l@{}}general\\ goals\\ \\ 0.00\end{tabular}         \\ \hline
\begin{tabular}[c]{@{}l@{}}TEAM\\ \\ \\ SFj\end{tabular} & \begin{tabular}[c]{@{}l@{}}very difficult\\ interactions\\ \\ 5.48\end{tabular} & \begin{tabular}[c]{@{}l@{}}some difficult\\ interactions\\ \\ 4.38\end{tabular} & \begin{tabular}[c]{@{}l@{}}basically \\ cooperative\\ interactions\\ 3.29\end{tabular} & \begin{tabular}[c]{@{}l@{}}largely\\ cooperative\\ \\ 2.19\end{tabular} & \begin{tabular}[c]{@{}l@{}}highly\\ cooperative\\ \\ 1.10\end{tabular} & \begin{tabular}[c]{@{}l@{}}seamless\\ interactions\\ \\ 0.00\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}RESL\\ \\ \\ Sfj\end{tabular} & \begin{tabular}[c]{@{}l@{}}little\\ (20\%)\\ \\ 7.07\end{tabular}               & \begin{tabular}[c]{@{}l@{}}some\\ (40\%)\\ \\ 5.65\end{tabular}                 & \begin{tabular}[c]{@{}l@{}}often\\ (60\%)\\ \\ 4.24\end{tabular}                       & \begin{tabular}[c]{@{}l@{}}generally\\ (75\%)\\ \\ 2.83\end{tabular}    & \begin{tabular}[c]{@{}l@{}}mostly\\ (90\%)\\ \\ 1.41\end{tabular}      & \begin{tabular}[c]{@{}l@{}}full\\ (100\%)\\ \\ 0.00\end{tabular}          \\ \hline
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

    We expect the effective size of out database to be remarkably high in relation to the expected SLOC. A Very High value is the most sensible choice.

<!----->
\begin{table}[H]
\centering
\caption{DATA}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{DATA Cost Driver}                                                                                                                                                                                                                                                                                                                                                                               \\ \hline
\begin{tabular}[c]{@{}l@{}}DATA\\ Descriptors\end{tabular}   &         & \begin{tabular}[c]{@{}l@{}}D/P \textless\\ 10\end{tabular} & \begin{tabular}[c]{@{}l@{}}10 \textless D/P \textless\\ 100\end{tabular} & \begin{tabular}[c]{@{}l@{}}100 \textless D/P\\ \textless 1000\end{tabular} & \begin{tabular}[c]{@{}l@{}}D/P \textgreater\\ 1000\end{tabular} &                                                      \\ \hline
Rating level                                                 & Ver Low & Low                                                        & Nominal                                                                  & High                                                                       & Very High                                                       & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & n/a     & 0.90                                                       & 1.00                                                                     & 1.14                                                                       & 1.28                                                            & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->



* Required reusability:

    The software produced in our project could be reusable for a car sharing service of a larger scale. The right RUSE cost driver is high.

<!----->
\begin{table}[H]
\centering
\caption{RUSE}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{RUSE Cost Driver}                                                                                                                                                                                                                                                                                                         \\ \hline
\begin{tabular}[c]{@{}l@{}}RUSE \\ Descriptors\end{tabular}  &         & None & \begin{tabular}[c]{@{}l@{}}Access\\ project\end{tabular} & \begin{tabular}[c]{@{}l@{}}Across\\ program\end{tabular} & \begin{tabular}[c]{@{}l@{}}Across\\ product line\end{tabular} & \begin{tabular}[c]{@{}l@{}}Across\\ multiple\\ product line\end{tabular} \\ \hline
Rating level                                                 & Ver Low & Low  & Nominal                                                  & High                                                     & Very High                                                     & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular}                     \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & n/a     & 0.95 & 1.00                                                     & 1.07                                                     & 1.15                                                          & 1.24                                                                     \\ \hline
\end{tabular}
\end{table}
<!----->

* Documentation match to life-cycle needs

    The documentation in our project covers the life cycle need of the system with care. The value is set to Nominal.

<!----->
\begin{table}[H]
\centering
\caption{DOCU}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{DOCU Cost Driver}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               \\ \hline
\begin{tabular}[c]{@{}l@{}}DOCU\\ Descriptors\end{tabular}   & \begin{tabular}[c]{@{}l@{}}Many\\ life-cycle\\ needs\\ uncovered\end{tabular} & \begin{tabular}[c]{@{}l@{}}Some\\ life-cycle\\ needs\\ uncovered\end{tabular} & \begin{tabular}[c]{@{}l@{}}Right-sized\\ to life-cycle\\ needs\end{tabular} & \begin{tabular}[c]{@{}l@{}}Excessive\\ for\\ life-cycle\\ needs\end{tabular} & \begin{tabular}[c]{@{}l@{}}Very\\ excessive\\ for life-cycle\\ needs\end{tabular} &                                                      \\ \hline
Rating level                                                 & Ver Low                                                                       & Low                                                                           & Nominal                                                                     & High                                                                         & Very High                                                                         & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & 0.81                                                                          & 0.91                                                                          & 1.00                                                                        & 1.11                                                                         & 1.23                                                                              & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

* Execution time constraint:

    Since the data flow from the cars and the system is constant we expect an high usage of the CPU with respect to our system computational capabilities. TIME is set to Very High.
<!----->
\begin{table}[H]
\centering
\caption{TIME}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{TIME Cost Driver}                                                                                                                                                                                                                                                                                                                                                                                                      \\ \hline
\begin{tabular}[c]{@{}l@{}}TIME\\ Descriptors\end{tabular}   &         &     & \begin{tabular}[c]{@{}l@{}}\textless 50\%use of \\ available\\ execution \\ time\end{tabular} & \begin{tabular}[c]{@{}l@{}}70\% use of\\ available\\ execution\\ time\end{tabular} & \begin{tabular}[c]{@{}l@{}}85\% use of\\ available\\ execution\\ time\end{tabular} & \begin{tabular}[c]{@{}l@{}}95\% use of\\ available\\ execution\\ time\end{tabular} \\ \hline
Rating level                                                 & Ver Low & Low & Nominal                                                                                       & High                                                                               & Very High                                                                          & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular}                               \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & n/a     & n/a & 1.00                                                                                          & 1.11                                                                               & 1.29                                                                               & 1.63                                                                               \\ \hline
\end{tabular}
\end{table}
<!----->

* Storage constraint:

    Even if our system will have to deal with a reasonable amount of data, we do not expect problems related to the storage availability. STOR is set to Nominal.

<!----->
\begin{table}[H]
\centering
\caption{STOR}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{STOR Cost Driver}                                                                                                                                                                                                                                                                                                                                                                 \\ \hline
\begin{tabular}[c]{@{}l@{}}STOR\\ Descriptors\end{tabular}   &         &     & \begin{tabular}[c]{@{}l@{}}\textless 50\%use of \\ available\\ storage\end{tabular} & \begin{tabular}[c]{@{}l@{}}70\% use of\\ available\\ storage\end{tabular} & \begin{tabular}[c]{@{}l@{}}85\% use of\\ available\\ storage\end{tabular} & \begin{tabular}[c]{@{}l@{}}95\% use of\\ available\\ storage\end{tabular} \\ \hline
Rating level                                                 & Ver Low & Low & Nominal                                                                             & High                                                                      & Very High                                                                 & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular}                      \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & n/a     & n/a & 1.00                                                                                & 1.05                                                                      & 1.17                                                                      & 1.46                                                                      \\ \hline
\end{tabular}
\end{table}
<!----->

* Platform Volatility:

    We do not expect the system to be under constant evolution. Nominal is the right value for the PVOL cost driver.

<!----->
\begin{table}[H]
\centering
\caption{PVOL}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{PVOL Cost Driver}                                                                                                                                                                                                                                                                                                                                                                                                                                                               \\ \hline
\begin{tabular}[c]{@{}l@{}}PVOL\\ Descriptors\end{tabular}   &         & \begin{tabular}[c]{@{}l@{}}Major change\\ e. 12mo.\\ Minor change\\ e. mo.\end{tabular} & \begin{tabular}[c]{@{}l@{}}Major change\\ e. 6mo\\ Minor change\\ e. 2wk.\end{tabular} & \begin{tabular}[c]{@{}l@{}}Major change\\ e. 2mo\\ Minor change\\ e. 1wk.\end{tabular} & \begin{tabular}[c]{@{}l@{}}Major change\\ e. 2wk\\ Minor change\\ e. 2 days\end{tabular} &                                                      \\ \hline
Rating level                                                 & Ver Low & Low                                                                                     & Nominal                                                                                & High                                                                                   & Very High                                                                                & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & n/a     & 0.87                                                                                    & 1.00                                                                                   & 1.15                                                                                   & 1.30                                                                                     & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->


* Analyst Capability:

    We are confident to have done a good work in analyzing the domain of our system. The ACAP driver is set to High.

<!----->
\begin{table}[H]
\centering
\caption{ACAP}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{ACAP Cost Driver}                                                                                                                                                                                                                                                                                                                                                                                          \\ \hline
\begin{tabular}[c]{@{}l@{}}ACAP\\ Descriptors\end{tabular}   & \begin{tabular}[c]{@{}l@{}}15th\\ percentile\end{tabular} & \begin{tabular}[c]{@{}l@{}}35th\\ percentile\end{tabular} & \begin{tabular}[c]{@{}l@{}}55th\\ percentile\end{tabular} & \begin{tabular}[c]{@{}l@{}}75th\\ percentile\end{tabular} & \begin{tabular}[c]{@{}l@{}}90th\\ percentile\end{tabular} &                                                      \\ \hline
Rating level                                                 & Ver Low                                                   & Low                                                       & Nominal                                                   & High                                                      & Very High                                                 & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & 1.42                                                      & 1.19                                                      & 1.00                                                      & 0.85                                                      & 0.71                                                      & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

* Programmer Capability:

    We confident in our team ability in programming. PCAP is set to high.

<!----->
\begin{table}[H]
\centering
\caption{PCAP}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{PCAP Cost Driver}                                                                                                                                                                                                                                                                                                                                                                                          \\ \hline
\begin{tabular}[c]{@{}l@{}}PCAP\\ Descriptors\end{tabular}   & \begin{tabular}[c]{@{}l@{}}15th\\ percentile\end{tabular} & \begin{tabular}[c]{@{}l@{}}35th\\ percentile\end{tabular} & \begin{tabular}[c]{@{}l@{}}55th\\ percentile\end{tabular} & \begin{tabular}[c]{@{}l@{}}75th\\ percentile\end{tabular} & \begin{tabular}[c]{@{}l@{}}90th\\ percentile\end{tabular} &                                                      \\ \hline
Rating level                                                 & Ver Low                                                   & Low                                                       & Nominal                                                   & High                                                      & Very High                                                 & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & 1.34                                                      & 1.15                                                      & 1.00                                                      & 0.88                                                      & 0.76                                                      & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

* Application experience:

    Even if we are experienced in Java, this is our first JEE application, so to be conservative, APEX is set to Low.

<!----->
\begin{table}[H]
\centering
\caption{APEX}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{APEX Cost Driver}                                                                                                                                                                                                                                                                                                                                                             \\ \hline
\begin{tabular}[c]{@{}l@{}}Apex\\ Descriptors\end{tabular}   & \begin{tabular}[c]{@{}l@{}}\textless2\\ months\end{tabular} & \begin{tabular}[c]{@{}l@{}}6\\ months\end{tabular} & \begin{tabular}[c]{@{}l@{}}1\\ years\end{tabular} & \begin{tabular}[c]{@{}l@{}}3\\ years\end{tabular} & \begin{tabular}[c]{@{}l@{}}6\\ years\end{tabular} &                                                      \\ \hline
Rating level                                                 & \begin{tabular}[c]{@{}l@{}}Very \\ Low\end{tabular}         & Low                                                & Nominal                                           & High                                              & Very High                                         & \begin{tabular}[c]{@{}l@{}}Extra\\ High\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & 1.22                                                        & 1.10                                               & 1.00                                              & 0.88                                              & 0.81                                              & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

* Platform Experience:

    As already said, we are not experienced in JEE and web development, PLEX is set to Low.

<!----->
\begin{table}[H]
\centering
\caption{PLEX}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{PLEX Cost Driver}                                                                                                                                                                                                                                                                                                                                                             \\ \hline
PLEXDescriptors                                              & \begin{tabular}[c]{@{}l@{}}\textless 2\\ months\end{tabular} & \begin{tabular}[c]{@{}l@{}}6\\ months\end{tabular} & \begin{tabular}[c]{@{}l@{}}1\\ year\end{tabular} & \begin{tabular}[c]{@{}l@{}}3\\ years\end{tabular} & \begin{tabular}[c]{@{}l@{}}6\\ years\end{tabular} &                                                      \\ \hline
Rating level                                                 & Ver Low                                                      & Low                                                & Nominal                                          & High                                              & Very High                                         & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & 1.19                                                         & 1.09                                               & 1.00                                             & 0.91                                              & 0.85                                              & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

* Language and Tool experience:

    We are not familiar with the kind of development tools needed for our project. LTEX is set to Low.

<!----->
\begin{table}[H]
\centering
\caption{LTEX}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{LTEX Cost Driver}                                                                                                                                                                                                                                                                                                                                                             \\ \hline
\begin{tabular}[c]{@{}l@{}}LTEX\\ Descriptors\end{tabular}   & \begin{tabular}[c]{@{}l@{}}\textless 2\\ months\end{tabular} & \begin{tabular}[c]{@{}l@{}}6\\ months\end{tabular} & \begin{tabular}[c]{@{}l@{}}1\\ year\end{tabular} & \begin{tabular}[c]{@{}l@{}}3\\ years\end{tabular} & \begin{tabular}[c]{@{}l@{}}6\\ years\end{tabular} &                                                      \\ \hline
Rating level                                                 & Ver Low                                                      & Low                                                & Nominal                                          & High                                              & Very High                                         & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & 1.20                                                         & 1.09                                               & 1.00                                             & 0.91                                              & 0.84                                              & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

* Personnel continuity:

    We don't expect an high turnover in our small team. PCON is set to High.
<!----->
\begin{table}[H]
\centering
\caption{PCON}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{PCON Cost Driver}                                                                                                                                                                                                                                                                                                                                                          \\ \hline
\begin{tabular}[c]{@{}l@{}}PCON\\ Descriptors\end{tabular}   & \begin{tabular}[c]{@{}l@{}}48\%\\ year\end{tabular} & \begin{tabular}[c]{@{}l@{}}24\%\\ year\end{tabular} & \begin{tabular}[c]{@{}l@{}}12\%\\ year\end{tabular} & \begin{tabular}[c]{@{}l@{}}6\%\\ year\end{tabular} & \begin{tabular}[c]{@{}l@{}}3\%\\ year\end{tabular} &                                                      \\ \hline
Rating level                                                 & Ver Low                                             & Low                                                 & Nominal                                             & High                                               & Very High                                          & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & 1.29                                                & 1.12                                                & 1.00                                                & 0.90                                               & 0.81                                               & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

* Usage of Software Tools:

    We have well documented the tools that we are going to use in development, we think the right value for TOOL is High.

<!----->
\begin{table}[H]
\centering
\caption{TOOL}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{TOOL Cost Driver}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    \\ \hline
\begin{tabular}[c]{@{}l@{}}TOOL\\ Descriptors\end{tabular}   & \begin{tabular}[c]{@{}l@{}}edit, code,\\ debug\end{tabular} & \begin{tabular}[c]{@{}l@{}}simple,\\ frontend,\\ backend, CASE,\\ little integration\end{tabular} & \begin{tabular}[c]{@{}l@{}}basic \\ life-cycle\\ tools,\\ moderately\\ integrated\end{tabular} & \begin{tabular}[c]{@{}l@{}}strong, mature\\ life-cycle \\ tools,\\ moderately\\ integrated\end{tabular} & \begin{tabular}[c]{@{}l@{}}string, mature,\\ proactive\\ life-cycle tools,\\ well integrated\\ with\\ processes,\\ methods,\\ reuse\end{tabular} &                                                      \\ \hline
Rating level                                                 & Ver Low                                                     & Low                                                                                               & Nominal                                                                                     & High                                                                                                 & Very High                                                                                                                                    & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & 1.17                                                        & 1.09                                                                                              & 1.00                                                                                        & 0.90                                                                                                 & 0.78                                                                                                                                         & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

* Multisite development:

    We will work in the same city with frequent meetings and simplicity in communications. SITE is set to High.

<!----->
\begin{table}[H]
\centering
\caption{SITE}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{SITE Cost Driver}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 \\ \hline
\begin{tabular}[c]{@{}l@{}}SITE \\Collocation\\ Descriptors\end{tabular}      & International                                              & \begin{tabular}[c]{@{}l@{}}Multi-city\\ or multi-\\company\end{tabular} & \begin{tabular}[c]{@{}l@{}}Multi-city\\ or multi-\\company\end{tabular} & \begin{tabular}[c]{@{}l@{}}Same city\\ or metro\\ area\end{tabular}             & \begin{tabular}[c]{@{}l@{}}Same \\building\\ or complex\end{tabular}                       & Fullycollocated                                                  \\ \hline
\begin{tabular}[c]{@{}l@{}}SITE\\ Communications\\ Descriptors\end{tabular} & \begin{tabular}[c]{@{}l@{}}Some phone,\\ mail\end{tabular} & \begin{tabular}[c]{@{}l@{}}Individual\\ phone,\\ fax\end{tabular}     & \begin{tabular}[c]{@{}l@{}}Narrow\\ band\\ email\end{tabular}         & \begin{tabular}[c]{@{}l@{}}Wideband\\ electronic\\ comm.\end{tabular} & \begin{tabular}[c]{@{}l@{}}Wideband\\ electr. \\comm.,\\ occasional \\video conf.\end{tabular} & \begin{tabular}[c]{@{}l@{}}Interactive\\ multimedia\end{tabular} \\ \hline
Rating level                                                                & Ver Low                                                    & Low                                                                   & Nominal                                                               & High                                                                          & Very High                                                                                & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular}             \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular}                & 1.22                                                       & 1.09                                                                  & 1.00                                                                  & 0.93                                                                          & 0.86                                                                                     & 0.80                                                             \\ \hline
\end{tabular}
\end{table}
<!----->

* Required development schedule:

    The schedule for our project was not particularly stretched out.  SCED is set to NOMINAL

<!----->
\begin{table}[H]
\centering
\caption{SCED}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{SCED Cost Driver}                                                                                                                                                                                                                                                                                                                                                                                             \\ \hline
\begin{tabular}[c]{@{}l@{}}SCED\\ descriptors\end{tabular}   & \begin{tabular}[c]{@{}l@{}}75\% of\\ nominal\end{tabular} & \begin{tabular}[c]{@{}l@{}}85\% of\\ nominal\end{tabular} & \begin{tabular}[c]{@{}l@{}}100\% of\\ nominal\end{tabular} & \begin{tabular}[c]{@{}l@{}}130\% of\\ nominal\end{tabular} & \begin{tabular}[c]{@{}l@{}}160\% of\\ nominal\end{tabular} &                                                      \\ \hline
Rating level                                                 & Ver Low                                                   & Low                                                       & Nominal                                                    & High                                                       & Very High                                                  & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & 1.43                                                      & 1.14                                                      & 1.00                                                       & 1.00                                                       & 1.00                                                       & n/a                                                  \\ \hline
\end{tabular}
\end{table}
<!----->

* Product complexity:

    Referencing to the COCOMO II classification, we think that the right value fort the complexity of our system is High.
<!----->
\begin{table}[H]
\centering
\caption{CPLEX}
\label{my-label}
\begin{tabular}{|l|l|l|l|l|l|l|}
\hline
\multicolumn{7}{|c|}{CPLX Cost Driver}                                                                                                                            \\ \hline
Rating level                                                 & Ver Low & Low  & Nominal & High & Very High & \begin{tabular}[c]{@{}l@{}}Extra\\ high\end{tabular} \\ \hline
\begin{tabular}[c]{@{}l@{}}Effort\\ multipliers\end{tabular} & 0.73    & 0.87 & 1.00    & 1.17 & 1.34      & 1.74                                                 \\ \hline
\end{tabular}
\end{table}
<!----->

Overall results:

<!----->
\begin{table}[H]
\centering
\caption{Results}
\label{my-label}
\begin{tabular}{|l|l|l|}
\hline
\multicolumn{1}{|c|}{Cost Driver}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            & Factor                                                                                                                                                                                             & Value                                                                                                                                                                             \\ \hline
\begin{tabular}[c]{@{}l@{}}Required Software Reliability (RELY)\\ Database size (DATA)\\ Required Reusability (RUSE)\\ Documentation match to life-cycle needs (DOCU)\\ Execution Time Constraint (TIME)\\ Main storage constraint (STOR)\\ Platform volatility (PVOL)\\ Analyst capability (ACAP)\\ Programmer capability (PCAP)\\ Application Experience (APEX)\\ Platform Experience (PLEX)\\ Language and Tool Experience (LTEX)\\ Personnel continuity (PCON)\\ Usage of Software Tools (TOOL)\\ Multisite development schedule (SITE)\\ Required development schedule (SCED)\\ Product complexity (CPLEX)\end{tabular} & \multicolumn{1}{c|}{\begin{tabular}[c]{@{}c@{}}Nominal\\ High\\ High\\ Nominal\\ Very High\\ Nominal\\ Nominal\\ High\\ High\\ Low\\ Low\\ Low\\ High\\ High\\ High\\ Nominal\\ High\end{tabular}} & \multicolumn{1}{c|}{\begin{tabular}[c]{@{}c@{}}1.00\\ 1.14\\ 1.07\\ 1.00\\ 1.29\\ 1.00\\ 1.00\\ 0.85\\ 0.88\\ 1.15\\ 1.09\\ 1.09\\ 0.90\\ 0.90\\ 0.93\\ 1.00\\ 1.17\end{tabular}} \\ \hline
\multicolumn{2}{|l|}{Total (Product)}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             & 1,41737                                                                                                                                                                           \\ \hline
\end{tabular}
\end{table}
<!----->

### 2.2.3 Effort equation

Finally we can use the values produced by our analysis to get the final estimation in PM (Person Months). (Simple calculations in Python)
```python
  A = 2.94
  EAF = 1.41737
  SF = [6.20, 3.04,  2.19, 4.24, 4.68]
  KSLOC_avg = 9890.0 / 1000.0
  KSLOC_max = 14405.0 / 1000.0
  B = 0.91
  E = B + 0.01 * sum(SF)

  effort_avg = A * EAF * KSLOC_avg ** E #PM
  effort_max = A * EAF * KSLOC_max ** E #PM
```

With results:


```python
  >>>effort_avg
  53.45417576793934
  >>>effort_max
  81.25219172083412
```



### 2.2.4 Schedule estimation

The estimation of the duration of the project is:

```python
  F = 0.28 + 0.3 * (E - B)
  duration_avg = 3.67 * effort_avg ** F #months
  duration_max = 3.67 * effort_max ** F #months
```

With results:

```python
  >>>duration_avg
  14.255885602518472
  >>>duration_max
  16.44429729890852
```

We will use these values in the next sections to produce a proper schedule for our project.
