package bustracking.model;


import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;


import bustracking.dao.MessageSending;
/**
 * Scheduler for handling jobs
 */
@Service
public class SchedulerService {

	protected static Logger logger = LoggerFactory.getLogger("service");

	@Autowired
	@Qualifier("syncWorker")
	private Worker worker;
	
	@Autowired
	MessageSending messageSending;


	/**
	 * You can opt for cron expression or fixedRate or fixedDelay
	 * <p>
	 * See Spring Framework 3 Reference:
	 * Chapter 25.5 Annotation Support for Scheduling and Asynchronous Execution
	 */
	//@Scheduled(fixedDelay=5000)
	//@Scheduled(fixedRate=5000)
	@Scheduled(cron="*/5 * * * * ?")
	public void doSchedule() {
		logger.debug("Start schedule");
		
		for (int i = 0; i < 5; i++) {
			logger.debug("Delegate to worker " + i);
		
		worker.work();
			try
			{
				System.out.println("Start sending..!!");
			//	messageSending.collectinfo();
			//messageSender.sendSMS("6315896007","Test Message");
				System.out.println("calling function!!!");
			System.out.println("Send");
			}
			catch(Exception ex)
			{
				System.out.println(ex.toString());
			}
			
        }
		
		logger.debug("End schedule");
	}
	

}
