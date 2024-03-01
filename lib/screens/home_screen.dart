import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/models/pdf_document.dart';
import 'package:myapp/providers/pdf_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:myapp/widgets/pdf_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PdfList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Open file picker to select a PDF
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['pdf'],
          );

          if (result != null) {
            // Get the PDF file
            File file = File(result.files.single.path!);

            // Get the PDF file name
            String fileName = result.files.single.name;

            // Save the PDF file to the app's directory
            Directory appDirectory = await getApplicationDocumentsDirectory();
            String newPath = '${appDirectory.path}/$fileName';
            await file.copy(newPath);

            // Add the PDF document to the provider
            PdfProvider pdfProvider = Provider.of<PdfProvider>(context, listen: false);
            pdfProvider.addPdfDocument(PdfDocument(name: fileName, path: newPath));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}