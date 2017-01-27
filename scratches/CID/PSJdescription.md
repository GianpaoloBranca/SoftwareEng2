####Role
The ofbiz project is very poorly documented and many aspect are not self explained.
According to the Javadoc a __PersistedServiceJob__ is A Job that is backed by the entity engine, and his data are stored in the JobSandbox entity.  
The JobSandbox entity is an instance of GenericValue called JobValue, with a bad naming. Note that the class __€œJobSandbox__ does not exist in the entire project.

PersistedServiceJob extends __GenericServiceJob__, an async-service job and the main realization of a Job. Itself extend __AbstractServiceJob__, and this last implements the interface __Job__.  

According to the JavaDoc:  
A job starts out in the created state. When the job is queued for execution, it transitions to the queued state. While the job is executing it is in the running state. When the job execution ends, it transitions to the finished or failed state - depending on the outcome of the task that was performed.

A PersistedServiceJob works as a GenericServiceJob, it can be queued, dequeued, executed and finish, but every overrided method also store the time, the status and the result of the job in the __JobSandBox__ . It can also fail, but differently to its superclass it can retry a certain number of time, decided by the JobSandBox.  


####Usages
It is used only once in the JobManager class, in the _poll(int)_ method, at line 225.
According to the documentation:  
this method scans the JobSandbox entity and returns a list of jobs that are due to run. Returns an empty list if there are no jobs due to run.
This method is called by the __JobPoller__ polling thread.    
A PersistedServiceJob is created whenever there is a job to run, added to the poll and returned to the JobPoller. The JobPoller class is explained in the next section.

