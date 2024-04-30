
use [raw_call_master]

BULK INSERT Feedback
from 'C:\Users\Marcel\Documents\Studia\data_warehouse\Schemas\DataWarehouse_git_rep_now\output\AdditionalSourcesT2CSV.csv'
with (format='CSV',
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		ROWTERMINATOR='0X0a');

