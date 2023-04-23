const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {

    const { ActivityLogs, Projects } = this.entities;

    //Calculate worked hours
    this.after("READ", ActivityLogs, (data) => {
        const activityLogs = Array.isArray(data) ? data : [data];

        activityLogs.forEach((activityLog) => {
            if (activityLog.timeFrom) {

                activityLog.hours = timeDifference(activityLog.timeFrom, activityLog.timeTo) - activityLog.break;
                
            } else { activityLog.hours = 0 }
        })

    })


    // //Set Criticality after a READ operation on /Projects
    // this.after("READ", Projects, (data) => {
    //     const projects = Array.isArray(data) ? data : [data];

    //     projects.forEach((project) => {

    //         const data = await cds.read('ActivityLogs').where({project_id:project.ID});
    //         const activityLogs = Array.isArray(data) ? data : [data];

    //         activityLogs.reduce((sum, log) =>

    //         );
    //         if(project.)

    //     })
    // })


})


function timeDifference(time1, time2) {
    // Convert time strings to Date objects
    const date1 = new Date(`01/01/2000 ${time1}`);
    const date2 = new Date(`01/01/2000 ${time2}`);
  
    // Calculate difference in milliseconds
    const diffMs = date2.getTime() - date1.getTime();
  
  // Convert milliseconds to decimal hours
  const diffHours = diffMs / (1000 * 60 * 60);

  // Return the difference as a decimal
  return diffHours.toFixed(2);
  }