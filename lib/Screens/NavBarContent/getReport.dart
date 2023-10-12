import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final pdf = pw.Document();

  writeOnPdf() {
    String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(level: 0, child: pw.Text("Diet Report")),
            pw.Header(level: 1, child: pw.Text("\n")),
            pw.Paragraph(text: "Prefered Food Menu: South Indian"),
            pw.Paragraph(text: "Taste: Sour"),
            pw.Paragraph(text: "Whether you smoke: No"),
            pw.Paragraph(text: "Whether you Drink(Alcohol): No"),
            pw.Paragraph(text: "High Blood Pressure: No"),
            pw.Paragraph(text: "Hyper Tension: No"),
            pw.Paragraph(text: "Diabetes: Yes"),
            pw.Paragraph(text: "Cardiovascular: yes"),
            pw.Paragraph(text: "--------------------------------------------------------------------------------"),
            pw.Paragraph(text: "Allergies"),
            pw.Paragraph(text: "--------------------------------------------------------------------------------"),
            pw.Paragraph(text: "Milk Allergies: No"),
            pw.Paragraph(text: "Nuts Allergies: No"),
            pw.Paragraph(text: "Fish Allergies: yes"),
            pw.Paragraph(text: "--------------------------------------------------------------------------------"),
            pw.Paragraph(text: "Percentages"), //kapha -6,5,-7
            pw.Paragraph(text: "Kapha : 27%"),
            pw.Paragraph(text: "Vata  : 37%"),
            pw.Paragraph(text: "Pitta : 36%"),
            pw.Paragraph(text: "--------------------------------------------------------------------------------"),
          ];
        },
      ),
    );
  }

  Future savePdf() async {
    File file = File("/storage/emulated/0/Download/report.pdf");
    file.writeAsBytesSync(List.from(await pdf.save()));
  }

  @override
  void initState() {
    writeOnPdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.07 + width * 0.01),
            Row(
              children: [
                SizedBox(width: width * 0.001 + height * 0.001),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: height * 0.03 + width * 0.01,
                    color: Colors.grey[400],
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/homepage');
                  },
                ),
                SizedBox(width: width * 0.01 + height * 0.01),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFfe8573),
                    ),
                    width: width * 0.4 + height * 0.16,
                    height: height * 0.07 + height * 0.01,
                    child: Center(
                      child: Text(
                        "Report",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                          fontSize: height * 0.02 + width * 0.01,
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(height: height * 0.01 + width * 0.01),
            Container(
              width: width * 0.3 + height * 0.3,
              height: height * 0.6 + width * 0.2,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFFeff7ee)),
              child: FutureBuilder<bool>(
                future: File("/storage/emulated/0/Download/report.pdf").exists(),
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return SfPdfViewer.file(File("/storage/emulated/0/Download/report.pdf"));
                  } else {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 340,
                          height: 400,
                          child: Image.asset("Assets/image/404.gif"),
                        ),
                        Text(
                          "Download Report",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: height * 0.02 + width * 0.01,
                            color: Colors.black,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            SizedBox(height: height * 0.03 + width * 0.01),
            Row(
              children: [
                SizedBox(
                  width: width * 0.015 + height * 0.01,
                ),
                SizedBox(
                  height: height * 0.0010 + width * 0.1,
                  width: height * 0.02 + width * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: const Color(0xFFfe8573),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    ),
                    onPressed: () async {
                      await savePdf();
                      setState(() {});
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: height * 0.01 + width * 0.002,
                          ),
                          Text(
                            'Download',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.013 + width * 0.01,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_rounded,
                            color: Colors.white,
                            size: height * 0.020 + width * 0.01,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.2 + height * 0.01,
                ),
                SizedBox(
                  height: height * 0.0010 + width * 0.1,
                  width: height * 0.02 + width * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: const Color(0xFFfe8573),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    ),
                    onPressed: () async {
                      File file = File("/storage/emulated/0/Download/report.pdf");
                      await file.delete();
                      setState(() {});
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: height * 0.01 + width * 0.002,
                          ),
                          Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.013 + width * 0.01,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_rounded,
                            color: Colors.white,
                            size: height * 0.020 + width * 0.01,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
