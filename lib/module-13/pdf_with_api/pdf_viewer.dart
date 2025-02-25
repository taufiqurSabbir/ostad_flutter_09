import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PdfViewer extends StatefulWidget {
  final String url;
  const PdfViewer({super.key, required this.url});

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  String? localFilePth;
  String ? totalPage;
  String ? currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPDF();
  }

  Future<void> loadPDF() async {
    final response = await http.get(Uri.parse(widget.url));
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/temp.pdf');
    await file.writeAsBytes(response.bodyBytes);

    setState(() {
      localFilePth = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: localFilePth == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SafeArea(
            child: Stack(
                    children: [
            
            PDFView(
              filePath: localFilePth,
              onRender: (pages) {
                print("total page: $pages");
                setState(() {
                  totalPage = pages.toString();
                });
              },
            
              onPageChanged: (page,total){
                setState(() {

                  currentPage = page.toString();
                });
              },
            ),
            Text('$currentPage / $totalPage',style: TextStyle(fontSize: 50),),
                    ],
                  ),
          ),
    );
  }
}
