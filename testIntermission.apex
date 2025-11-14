System.debug('hello world');
Id personAccountRecordTypeId =  Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('PersonAccount').getRecordTypeId();

Account newPersonAccount = new Account();

// for person accounts we can not update the Name field instead we have to update the    FirstName and LastName individually

 newPersonAccount.FirstName = 'Test';
 newPersonAccount.LastName = 'Account';

insert newPersonAccount;
