nyc_record = LOAD 'gs://pda-org-data/Nyc_Data' USING PigStorage(',') AS(Summons_Number:chararray,Plate_ID:chararray,Registration_State:chararray,Plate_Type:chararray,Issue_Date:chararray,Violation_Code:chararray,Vehicle_Body_Type:chararray,Vehicle_Make:chararray,Issuing_Agency:chararray,Street_Code1:chararray,Vehicle_Expiration_Date:chararray,Violation_Location:chararray,Issuer_Code:chararray,Issuer_Command:chararray,Violation_Time:chararray,Time_First_Observed:chararray,Violation_County:chararray,Violation_In_Front_Of_Or_Opp:chararray,Street_Name:chararray,Law_Section:chararray,Days_Parking_In_Effect:chararray,From_Hours_In_Effect:chararray,To_Hours_In_Effect:chararray,Vehicle_Color:chararray,Vehicle_Year:chararray);

county_record = GROUP nyc_record BY Registration_State;
output_record = FOREACH county_record GENERATE group, COUNT(nyc_record.Registration_State);

store output_record into 'gs://pda-org-data/PIG/output' using PigStorage(',','-schema');
