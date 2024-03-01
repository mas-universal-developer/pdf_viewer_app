import 'package:flutter/material.dart';
import 'package:myapp/models/pdf_document.dart';
import 'package:myapp/providers/pdf_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class PdfList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PdfProvider pdfProvider = Provider.of<PdfProvider>(context);

    return ListView.builder(
      itemCount: pdfProvider.pdfDocuments.length,
      itemBuilder: (context, index) {
        PdfDocument pdfDocument = pdfProvider.pdfDocuments[index];
        return ListTile(
          title: Text(pdfDocument.name),
          onTap: () {
            // Open the selected PDF document
            OpenFile.open(pdfDocument.path, type: 'application/pdf', uti: 'public.data');
          },
        );
      },
    );
  }
}