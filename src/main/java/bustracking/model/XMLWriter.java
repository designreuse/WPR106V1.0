package bustracking.model;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class XMLWriter {

	private static final String xmlFilePath ="D:\\GPS_Try\\Code\\src\\main\\webapp\\resources\\images\\newXMLfile.xml";

	public static void createXML(List<LatLong> trackinginfos) {

		try {

			
			
			Element company = new Element("company");

			Document document = new Document(company);
			

			int i=0;
for (LatLong trackinginfo : trackinginfos) {
	i++;
	Element location = new Element("location");
	location.addContent(new Element("latitude").setText(trackinginfo.getLatitude()));
	location.addContent(new Element("longitude").setText(trackinginfo.getLongitude()));
document.getRootElement().addContent(location);
	
}

			XMLOutputter xmlOutputer = new XMLOutputter();

			// you can use this tou output the XML content to
			// the standard output for debugging purposes 
			// new XMLOutputter().output(doc, System.out);

			// write the XML File with a nice formating and alignment
			xmlOutputer.setFormat(Format.getPrettyFormat());
			File f=new File(xmlFilePath);
			if(f.exists())
			{
				System.out.println("yes deleted!!");
				f.delete();
			}
				
			
			xmlOutputer.output(document, new FileWriter(xmlFilePath));

			System.out.println("XML File was created successfully!");

		} catch (IOException ex) {
			System.out.println(ex.getMessage());
		}
	}
}