namespace hikes.timesheet;
using {managed} from '@sap/cds/common';

entity ActivityLogs: managed {
    key ID: UUID @(Core.Computed: true);
    employee: Association to Employees;
    project: Association to Projects;
    date: Date;
    hours: Decimal(2,2);
    timeFrom: Time;
    timeTo: Time;
    break: Decimal;
    description: String(100);
}

entity Employees: managed {
    key ID: UUID @(Core.Computed: true);
    firstName: String;
    lastName: String;
}

entity Projects: managed {
    key ID: UUID @(Core.Computed: true);
    name: String;
    customer: Association to Customers;
    budget: Decimal(8, 2);
    remainingBudget: Decimal(8,2);
    validFrom: Date;
    validTo: Date;
    contract: Integer;
    remainingBudgetCriticality: Integer

}

entity Customers: managed {
    key ID: UUID @(Core.Computed: true);
    name: String;
}