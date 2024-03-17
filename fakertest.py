from faker import Faker
from faker.providers import DynamicProvider 
from random import random, sample
import numpy as np
import csv
from datetime import date

# Do testów 
fake=Faker()
class Data(Faker):
    def __init__(self) -> None:
        #inicjalizacja wszystkich zmiennych:
        
        #Do podglądu printf
        self.Sample_size=5
        self.Ticket_Description_Chars=30

        #ilość wierszy w danej tabeli w danym TimeLine

        self.Ticket_Number=             20000
        self.TicketResolution_Number=   20000
        self.Customer_Number=           500
        self.Employees_Number=          500


        self.Ticket_NumberT2=           2000
        self.TicketResolution_NumberT2= 2000
        self.Customer_NumberT2=         50
        self.Employees_NumberT2=        50

    #Zapisywanie do pliku CSV
    def to_csv(self,data_dict, filename):
        with open(filename, 'w', newline='') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=data_dict.keys())
            writer.writeheader()
            writer.writerows([dict(zip(data_dict, d)) for d in zip(*data_dict.values())])


    def Department(self)->None:
       
       #nazwy listy departmentów
        self.Department_list=[   
            "Technical Support Department",
            "Customer Care Department",
            "IT Solutions Department",
            "Network Operations Center (NOC)",
            "Systems Administration Department",
            "Software Engineering Department",
            "Hardware Support Department",
            "Application Support Department",
            "Security Operations Center (SOC)",
            "Infrastructure Management Department"]
        
        self.Department_size=len(self.Department_list)

        
        self.Department_departmentID=[fake.unique.random_int(1,self.Department_size) for i in range (self.Department_size)]
        

        print(f"\n\n DEPARTMENT SAMPLE HEAD({self.Sample_size})\n\n Department Names {self.Department_list[self.Sample_size:]} \n Department ID {self.Department_departmentID[self.Sample_size:]}")
    
    def DepartmentBulk(self)->None:
        data_dict = {
            'DepartmentID': self.Department_departmentID,
            'Name': self.Department_list
        }
        self.to_csv(data_dict, 'Department.csv')


    def Employees(self)->None:
        

        self.Employee_Position_list=[   
            'Help Desk Technician',
            'Customer Support Representative',
            'Technical Support Specialist',
            'IT Support Analyst',
            'Service Desk Associate',
            'Help Desk Administrator',
            'Desktop Support Technician',
            'Support Engineer',
            'IT Help Desk Specialist',
            'User Support Technician']
    


        self.Employees_EmployeeID=sample(range(1,self.Employees_Number+1),self.Employees_Number)
        
        self.Employee_Name=[fake.first_name() for i in range(self.Employees_Number)]

        self.Employee_Address=[fake.address().split('\n')[0] for i in range(self.Employees_Number)]

        self.Employee_Position=[np.random.choice(self.Employee_Position_list) for i in range(self.Employees_Number)]

        self.Employee_departmentID=[np.random.choice(self.Department_departmentID) for i in range(self.Employees_Number)]
 
        print(f"\n\n EMPLOYEE SAMPLE HEAD({self.Sample_size})\n\n EmployeeID {self.Employees_EmployeeID[:self.Sample_size]} \n Name {self.Employee_Name[:self.Sample_size]} \n Address {self.Employee_Address[:self.Sample_size]} \n Position {self.Employee_Position[:self.Sample_size]}\n DepartmentID {self.Employee_departmentID[self.Sample_size:]}")


        # T2
        self.Employees_EmployeeIDT2=sample(range(self.Employees_Number+1,self.Employees_NumberT2+self.Employees_Number+1),self.Employees_NumberT2)

        self.Employee_NameT2=[fake.first_name() for i in range(self.Employees_NumberT2)]

        self.Employee_AddressT2=[fake.address().split('\n')[0] for i in range(self.Employees_NumberT2)]

        self.Employee_PositionT2=[np.random.choice(self.Employee_Position_list) for i in range(self.Employees_NumberT2)]

        self.Employee_departmentIDT2=[np.random.choice(self.Department_departmentID) for i in range(self.Employees_NumberT2)]
 


    def EmployeesBulk(self)->None:
        data_dict = {
        'EmployeeID': self.Employees_EmployeeID,
        'Name': self.Employee_Name,
        'Address': self.Employee_Address,
        'Position': self.Employee_Position,
        'DepartmentID': self.Employee_departmentID
        }
        self.to_csv(data_dict, 'Employees.csv')

        data_dict = {
        'EmployeeID': self.Employees_EmployeeIDT2,
        'Name': self.Employee_NameT2,
        'Address': self.Employee_AddressT2,
        'Position': self.Employee_PositionT2,
        'DepartmentID': self.Employee_departmentIDT2
        }
        self.to_csv(data_dict, 'EmployeesT2.csv')

    def Customer(self)->None:



        self.Customer_CustomerID=sample(range(1,self.Customer_Number+1),self.Customer_Number)
        # self.Customer_CustomerID=[fake.unique.random_int(1,self.Customer_Number) for i in range (self.Customer_Number)]
      
        self.Customer_Name=[fake.first_name() for i in range(self.Customer_Number)]

        self.Customer_Email=[fake.free_email() for i in range(self.Customer_Number)]

        self.Customer_Phone=[fake.phone_number()[:10] for i in range(self.Customer_Number)]

        print(f"\n\n CUSTOMER SAMPLE HEAD \n\n CustomerID{self.Customer_CustomerID[:self.Sample_size]} \n Name{self.Customer_Name[:self.Sample_size]} \n E-mail {self.Customer_Email[:self.Sample_size]} \n Phone {self.Customer_Phone[:self.Sample_size]}" )
    
        # T2
        self.Customer_CustomerIDT2=sample(range(self.Customer_Number+1,self.Customer_Number+self.Customer_NumberT2+1),self.Customer_NumberT2)
      
        self.Customer_NameT2=[fake.first_name() for i in range(self.Customer_NumberT2)]

        self.Customer_EmailT2=[fake.free_email() for i in range(self.Customer_NumberT2)]

        self.Customer_PhoneT2=[fake.phone_number()[:10] for i in range(self.Customer_NumberT2)]
    
    def CustomerBulk(self)->None:
        data_dict = {
        'CustomerID': self.Customer_CustomerID,
        'Name': self.Customer_Name,
        'E-mail': self.Customer_Email,
        'Phone': self.Customer_Phone
        }
        self.to_csv(data_dict, 'Customer.csv')

        data_dict = {
        'CustomerID': self.Customer_CustomerIDT2,
        'Name': self.Customer_NameT2,
        'E-mail': self.Customer_EmailT2,
        'Phone': self.Customer_PhoneT2,
        }
        self.to_csv(data_dict, 'CustomerT2.csv')


    def Category(self)->None:
        self.Category_Name=[
            'Software Issues',
            'Hardware Issues',
            'Network Connectivity Problems',
            'Email Configuration and Troubleshooting',
            'Printer and Peripheral Setup/Issues',
            'Account Access and Permissions',
            'Password Resets',
            'Application Errors',
            'Virus and Malware Removal',
            'Data Backup and Restoration',
            'System Performance Degradation',
            'Mobile Device Setup and Troubleshooting',
            'Software Installation and Updates',
            'Security Concerns',
            'Training and User Guidance',
            'Remote Access Support',
            'Licensing and Software Activation',
            'System Updates and Patch Management',
            'Website Access and Navigation Assistance',
            'General Technical Inquiries']
        
        self.Category_Number=len(self.Category_Name)

        self.Category_CategoryID = sample(range(1, self.Category_Number + 1), self.Category_Number)

        print(f"\n\n Category SAMPLE HEAD({self.Sample_size})\n\n Category Names {self.Category_Name[:self.Sample_size]} \n Category ID {self.Category_CategoryID[:self.Sample_size]}")
        
    def CategoryBulk(self)->None:

        data_dict = {
        'CategoryID': self.Category_CategoryID,
        'Name': self.Category_Name
        }
        self.to_csv(data_dict, 'Category.csv')


    def Ticket(self)->None:
        self.Ticket_Title_list=[
            "Issue",
            "Problem",
            "Error",
            "Incident",
            "Request",
            "Concern",
            "Inquiry",
            "Support",
            "Assistance",
            "Help",
            "Technical",
            "IT",
            "Troubleshooting",
            "Maintenance",
            "Configuration",
            "Setup",
            "Installation",
            "Access",
            "Connectivity",
            "Performance"]
        
        self.Ticket_Priority_list=['Low','Medium','High']


        self.Ticket_TicketID = sample(range(1, self.Ticket_Number + 1), self.Ticket_Number)
        # self.Ticket_TicketID=[fake.unique.random_int(1,self.Ticket_Number) for i in range (self.Ticket_Number)]
        
        self.Ticket_Title=[np.random.choice(self.Ticket_Title_list) for i in range(self.Ticket_Number)]

        self.Ticket_Description=[fake.text(max_nb_chars=self.Ticket_Description_Chars) for i in range(self.Ticket_Number)]

        self.Ticket_Priority=[np.random.choice(self.Ticket_Priority_list) for i in range(self.Ticket_Number)]

        self.Ticket_CustomerID=[np.random.choice(self.Customer_CustomerID) for i in range(self.Ticket_Number)]

        self.Ticket_CategoryID=[np.random.choice(self.Category_CategoryID) for i in range(self.Ticket_Number)]

        print(f"\n\n Ticket SAMPLE HEAD \n\n TicketID{self.Ticket_TicketID[:self.Sample_size]} \n Title{self.Ticket_Title[:self.Sample_size]} \n Description {self.Ticket_Description[:self.Sample_size]} \n Priority {self.Ticket_Priority[:self.Sample_size]}\n CustomerID {self.Ticket_CustomerID[:self.Sample_size]} \n CategoryID {self.Ticket_CategoryID[:self.Sample_size]}" )
        
        # T2
        self.Ticket_TicketIDT2 = sample(range(self.Ticket_Number + 1, self.Ticket_NumberT2+self.Ticket_Number + 1), self.Ticket_NumberT2)
        
        self.Ticket_TitleT2=[np.random.choice(self.Ticket_Title_list) for i in range(self.Ticket_NumberT2)]

        self.Ticket_DescriptionT2=[fake.text(max_nb_chars=self.Ticket_Description_Chars) for i in range(self.Ticket_NumberT2)]

        self.Ticket_PriorityT2=[np.random.choice(self.Ticket_Priority_list) for i in range(self.Ticket_NumberT2)]

        self.Ticket_CustomerIDT2=[np.random.choice(self.Customer_Number+self.Customer_NumberT2) for i in range(self.Ticket_NumberT2)]

        # self.Ticket_CustomerIDT2=sample(range(1,self.Customer_Number+self.Customer_NumberT2+1),self.Ticket_NumberT2)

        self.Ticket_CategoryIDT2=[np.random.choice(self.Category_CategoryID) for i in range(self.Ticket_NumberT2)]

    def TicketBulk(self)->None:

        data_dict = {
        'TicketID': self.Ticket_TicketID,
        'Title': self.Ticket_Title,
        'Description': self.Ticket_Description,
        'Priority': self.Ticket_Priority,
        'CustomerID': self.Ticket_CustomerID,
        'CategoryID': self.Ticket_CategoryID
        }
        self.to_csv(data_dict, 'Ticket.csv')

        data_dict = {
        'TicketID': self.Ticket_TicketIDT2,
        'Title': self.Ticket_TitleT2,
        'Description': self.Ticket_DescriptionT2,
        'Priority': self.Ticket_PriorityT2,
        'CustomerID': self.Ticket_CustomerIDT2,
        'CategoryID': self.Ticket_CategoryIDT2
        }
        self.to_csv(data_dict, 'TicketT2.csv')


    def TicketResolution(self)->None:
        
        self.TicketResolution_ResolutionType_list=['Processing','Finished']
        self.TicketResolution_ResolutionType_weights=[0.2,0.8]
        self.TicketResolution_Escalated_list=['true','false']
        self.TicketResolution_Escalated_weights=[0.3,0.7]

        self.TicketResolution_ResolutionID=sample(range(1,self.TicketResolution_Number+1) , self.TicketResolution_Number)

        self.TicketResolution_TicketID=sample(range(1,self.TicketResolution_Number+1) , self.TicketResolution_Number)

        self.TicketResolution_EmployeeId=[np.random.choice(self.Employees_EmployeeID) for i in range(self.TicketResolution_Number)]

        self.TicketResolution_ResolutionType=[np.random.choice(self.TicketResolution_ResolutionType_list,p=self.TicketResolution_ResolutionType_weights) for i in range(self.TicketResolution_Number)]

        self.TicketResolution_Escalated=[np.random.choice(self.TicketResolution_Escalated_list,p=self.TicketResolution_Escalated_weights) for i in range(self.TicketResolution_Number)]
        
        self.TicketResolution_CreationDate=[fake.date_between(start_date=date(2023,1,1),end_date=date(2023,12,31)) for i in range(self.TicketResolution_Number)]

        # self.TicketResolution_CreationDate=[fake.date_this_year() for i in range(self.TicketResolution_Number)]
       
        self.TicketResolution_ResponseTime=[fake.random_int(30,120) for i in range(self.TicketResolution_Number)]
       
        self.TicketResolution_ResolutionTime=[fake.random_int(120,320) for i in range(self.TicketResolution_Number)]

        self.TicketResolution_Notes=[fake.text(max_nb_chars=self.Ticket_Description_Chars) for i in range(self.TicketResolution_Number)]

        print(f"\n\n TICKET RESOLUTION SAMPLE HEAD \n\n ResolutionID{self.TicketResolution_ResolutionID[:self.Sample_size]} \n TicketID{self.TicketResolution_TicketID[:self.Sample_size]} \n EmployeeId {self.TicketResolution_EmployeeId[:self.Sample_size]} \n ResolutionType {self.TicketResolution_ResolutionType[:self.Sample_size]} \n Escalated {self.TicketResolution_Escalated[:self.Sample_size]} \n CreationDate {self.TicketResolution_CreationDate[:self.Sample_size]} \n ResponseTime {self.TicketResolution_ResponseTime[:self.Sample_size]} \n ResolutionTime {self.TicketResolution_ResolutionTime[:self.Sample_size]}")
    


        # T2
        self.TicketResolution_ResolutionIDT2=sample(range(self.TicketResolution_Number+1,self.TicketResolution_NumberT2+self.TicketResolution_Number+1) , self.TicketResolution_NumberT2)

        self.TicketResolution_TicketIDT2 = [np.random.randint(1,self.Ticket_Number+self.Ticket_NumberT2) for i in range(self.TicketResolution_NumberT2)]

        # Błędy z występowaniem 0 jako EmployeeID 
        # self.TicketResolution_EmployeeIdT2= [np.random.choice(self.Employees_Number+self.Employees_NumberT2) for i in range(self.TicketResolution_NumberT2)]
        
        self.TicketResolution_EmployeeIdT2 =[np.random.randint(1, self.Employees_Number+self.Employees_NumberT2) for i in range(self.TicketResolution_NumberT2)]

        self.TicketResolution_ResolutionTypeT2=[np.random.choice(self.TicketResolution_ResolutionType_list,p=self.TicketResolution_ResolutionType_weights) for i in range(self.TicketResolution_NumberT2)]

        self.TicketResolution_EscalatedT2=[np.random.choice(self.TicketResolution_Escalated_list,p=self.TicketResolution_Escalated_weights) for i in range(self.TicketResolution_NumberT2)]
        
        self.TicketResolution_CreationDateT2=[fake.date_between(start_date=date(2024,1,1),end_date=date(2024,12,31)) for i in range(self.TicketResolution_NumberT2)]
       
        self.TicketResolution_ResponseTimeT2=[fake.random_int(30,120) for i in range(self.TicketResolution_NumberT2)]
       
        self.TicketResolution_ResolutionTimeT2=[fake.random_int(120,320) for i in range(self.TicketResolution_NumberT2)]

        self.TicketResolution_NotesT2=[fake.text(max_nb_chars=self.Ticket_Description_Chars) for i in range(self.TicketResolution_NumberT2)]

    def TicketResolutionBulk(self)->None:
        data_dict = {
        'ResolutionID': self.TicketResolution_ResolutionID,
        'TicketID': self.TicketResolution_TicketID,
        'EmployeeID': self.TicketResolution_EmployeeId,
        'ResolutionType': self.TicketResolution_ResolutionType,
        'Escalated': self.TicketResolution_Escalated,
        'CreationDate': self.TicketResolution_CreationDate,
        'ResponseTime': self.TicketResolution_ResponseTime,
        'ResolutionTime': self.TicketResolution_ResolutionTime,
        'Notes': self.TicketResolution_Notes
        }
        self.to_csv(data_dict, 'TicketResolution.csv')

        data_dict = {
        'ResolutionID': self.TicketResolution_ResolutionIDT2,
        'TicketID': self.TicketResolution_TicketIDT2,
        'EmployeeID': self.TicketResolution_EmployeeIdT2,
        'ResolutionType': self.TicketResolution_ResolutionTypeT2,
        'Escalated': self.TicketResolution_EscalatedT2,
        'CreationDate': self.TicketResolution_CreationDateT2,
        'ResponseTime': self.TicketResolution_ResponseTimeT2,
        'ResolutionTime': self.TicketResolution_ResolutionTimeT2,
        'Notes': self.TicketResolution_NotesT2
        }
        self.to_csv(data_dict, 'TicketResolutionT2.csv')


data=Data()
data.Department()
data.Employees()
data.EmployeesBulk()
data.Customer()
data.CustomerBulk()
data.Category()
data.Ticket()
data.TicketBulk()
data.TicketResolution()
data.TicketResolutionBulk()

#kolejność wgrywania plkiów BULK:




