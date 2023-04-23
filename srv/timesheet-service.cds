using hikes.timesheet as ts from '../db/data-model';

@path: 'service/Timesheet'
service TimesheetService {
    // entity ActivityLogs @(restrict: [

    // ]) as projection on ts.ActivityLogs;
    entity ActivityLogs as projection on ts.ActivityLogs;
    annotate ActivityLogs with @odata.draft.enabled;

    // entity Projects @(restrict: [

    // ]) as projection on ts.Projects;
    entity Projects () as projection on ts.Projects;
    annotate Projects with @odata.draft.enabled;

    entity Employees () as projection on ts.Employees;
    annotate Employees with @odata.draft.enabled;

}