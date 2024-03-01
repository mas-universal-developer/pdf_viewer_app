import 'package:flutter/material.dart';
import 'package:myapp/models/pdf_document.dart';

class PdfProvider extends ChangeNotifier {
  List<PdfDocument> _pdfDocuments = [];

  List<PdfDocument> get pdfDocuments => _pdfDocuments;

  void addPdfDocument(PdfDocument pdfDocument) {
    _pdfDocuments.add(pdfDocument);
    notifyListeners();
  }
}
