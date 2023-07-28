import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var cellMaskFormatter =
    MaskTextInputFormatter(mask: '##-####-####', filter: {"#": RegExp(r'\d')});

var fullCellMaskFormatter = MaskTextInputFormatter(
    mask: '##-##-####-####', filter: {"#": RegExp(r'\d')});
