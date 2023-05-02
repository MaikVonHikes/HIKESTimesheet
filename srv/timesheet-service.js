const cds = require("@sap/cds");
const { resolveRequiredSapModels } = require("@sap/cds/bin/build/util");

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

        //Test

    })

    //Set Criticality after a READ operation on /Projects
    this.after("READ", Projects, async (data) => {

        const projects = Array.isArray(data) ? data : [data];

        await Promise.all(projects.map(async (project) => {
            const data = await this.read('ActivityLogs').where({ project_id: projects[0].ID });
            const activityLogs = Array.isArray(data) ? data : [data];
            const usedHours = activityLogs.reduce((accumulator, activityLog) =>
                accumulator + activityLog["hours"], 0
            );
            const usedBudget = usedHours * project.contract;
            project.remainingBudget = project.budget - usedBudget;

            const criticalFromBudget = project.budget * 0.1;

            if (project.remainingBudget > criticalFromBudget) {
                project.remainingBudgetCriticality = 3; //grün
            } else if (project.remainingBudget <= criticalFromBudget) {
                project.remainingBudgetCriticality = 2 //gelb
            } else {
                project.remainingBudgetCriticality = 1 //rot
            }

        }));
    })

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