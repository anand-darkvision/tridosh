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
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a5,
      margin: const pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(
              level: 0,
              child: pw.Text(
                "Diet Report",
              )),
          pw.Header(level: 1, child: pw.Text("\n")),
          pw.Paragraph(text: "Prefered Food Menu : South Indian"),
          pw.Paragraph(text: "Taste: Sour "),
          pw.Paragraph(text: "Whether you smoke : No"),
          pw.Paragraph(text: "Whether you Drink(Alchol) : No"),
          pw.Paragraph(text: "High Blood Pressure : No"),
          pw.Paragraph(text: "Hyper Tension : No"),
          pw.Paragraph(text: "Diabetes : Yes"),
          pw.Paragraph(text: "Cardiovascular : yes"),
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
    ));
  }

  Future savePdf() async {
    File file = File("/storage/emulated/0/Download/report.pdf");
    file.writeAsBytesSync(List.from(await pdf.save()));
  }

  @override
  Widget build(BuildContext context) {
    //screen size
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.07 + width * 0.01,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.001 + height * 0.001,
                ),
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
                SizedBox(
                  width: width * 0.01 + height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFFfe8573),
                  ),
                  width: width * 0.4 + height * 0.16,
                  height: height * 0.07 + height * 0.01,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 600,
                        width: 370,
                        child: File("/storage/emulated/0/Download/report.pdf").existsSync()
                            ? SfPdfViewer.file(File("/storage/emulated/0/Download/report.pdf"))
                            : Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 340,
                                    height: 400,
                                    child: Image.asset("Assets/image/404.gif"),
                                  ),
                                  const Text(
                                    "Download Pdf TO view",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontFamily: "Sharetech",
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01 + width * 0.01,
            ),
            Container(
              width: width * 0.3 + height * 0.3,
              height: height * 0.7 + width * 0.2,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFFeff7ee)),
            ),
          ],
        ),
      ),
    );
  }
}
