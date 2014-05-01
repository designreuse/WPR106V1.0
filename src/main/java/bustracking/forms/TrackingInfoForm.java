package bustracking.forms;

import java.util.ArrayList;
import java.util.List;

import bustracking.model.Trackinginfo;

public class TrackingInfoForm
{
	private List<Trackinginfo> trackinginfos=new ArrayList<Trackinginfo>();

	public List<Trackinginfo> getTrackinginfos() {
		return trackinginfos;
	}

	public void setTrackinginfos(List<Trackinginfo> trackinginfos) {
		this.trackinginfos = trackinginfos;
	}
	
	
}